package com.disasterapp.disaster_management_app

import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioRecord
import android.media.AudioTrack
import android.media.MediaRecorder
import android.util.Log
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.*
import kotlinx.coroutines.channels.Channel

/**
 * Native Android audio service for walkie-talkie PTT.
 *
 * Uses AudioRecord for capture and AudioTrack for playback directly,
 * bypassing all Flutter audio plugin instability.
 *
 * MethodChannel:  "com.disasterapp/audio"
 * EventChannel:   "com.disasterapp/audio_stream"  (delivers captured PCM bytes to Dart)
 */
class AudioService(private val scope: CoroutineScope) :
    MethodChannel.MethodCallHandler,
    EventChannel.StreamHandler {

    companion object {
        const val METHOD_CHANNEL = "com.disasterapp/audio"
        const val EVENT_CHANNEL  = "com.disasterapp/audio_stream"
        private const val TAG           = "WalkieTalkieAudio"
        private const val SAMPLE_RATE   = 16000
        private const val CHANNEL_IN    = AudioFormat.CHANNEL_IN_MONO
        private const val CHANNEL_OUT   = AudioFormat.CHANNEL_OUT_MONO
        private const val AUDIO_FORMAT  = AudioFormat.ENCODING_PCM_16BIT
        private const val FRAME_DURATION_MS = 20
        private const val FRAME_SIZE =
            SAMPLE_RATE * 2 * FRAME_DURATION_MS / 1000  // 640 bytes = 20ms
    }

    // ── Capture ──────────────────────────────────────────────────────────────
    private var audioRecord: AudioRecord? = null
    private var captureJob: Job? = null
    private var eventSink: EventChannel.EventSink? = null

    // ── Playback ─────────────────────────────────────────────────────────────
    private var audioTrack: AudioTrack? = null
    private var playbackChannel: Channel<ByteArray>? = null
    private var playbackJob: Job? = null

    // ── EventChannel (capture → Dart) ─────────────────────────────────────
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }

    // ── MethodChannel ────────────────────────────────────────────────────────
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startCapture"  -> { startCapture(result) }
            "stopCapture"   -> { stopCapture(result) }
            "startPlayback" -> { startPlayback(result) }
            "playChunk"     -> {
                val bytes = call.argument<ByteArray>("data")
                if (bytes != null) playChunk(bytes, result) else result.error("NO_DATA", "No data", null)
            }
            "stopPlayback"  -> { stopPlayback(result) }
            else            -> result.notImplemented()
        }
    }

    // ── Capture implementation ────────────────────────────────────────────
    private fun startCapture(result: MethodChannel.Result) {
        if (captureJob?.isActive == true) {
            result.success(null)
            return
        }

        val minBuf = AudioRecord.getMinBufferSize(SAMPLE_RATE, CHANNEL_IN, AUDIO_FORMAT)
        val bufSize = maxOf(minBuf, FRAME_SIZE * 4)
        Log.d(TAG, "startCapture: minBuf=$minBuf bufSize=$bufSize")

        audioRecord = AudioRecord(
            MediaRecorder.AudioSource.VOICE_COMMUNICATION,
            SAMPLE_RATE, CHANNEL_IN, AUDIO_FORMAT, bufSize
        )

        if (audioRecord!!.state != AudioRecord.STATE_INITIALIZED) {
            Log.e(TAG, "AudioRecord init failed")
            result.error("INIT_ERROR", "AudioRecord init failed", null)
            audioRecord = null
            return
        }

        audioRecord!!.startRecording()
        result.success(null)
        Log.d(TAG, "AudioRecord started, sending frames via EventChannel")

        captureJob = scope.launch(Dispatchers.IO) {
            val frame = ByteArray(FRAME_SIZE)
            val record = audioRecord
            try {
                while (isActive && record != null) {
                    val read = record.read(frame, 0, frame.size)
                    if (read > 0) {
                        val chunk = frame.copyOf(read)
                        withContext(Dispatchers.Main) {
                            eventSink?.success(chunk)
                        }
                    } else if (read < 0) {
                        break
                    }
                }
            } catch (e: Exception) {
                Log.e(TAG, "AudioRecord read exception", e)
            } finally {
                try {
                    record?.release()
                } catch (e: Exception) {
                    Log.e(TAG, "AudioRecord release exception", e)
                }
            }
            Log.d(TAG, "Capture loop ended")
        }
    }

    private fun stopCapture(result: MethodChannel.Result) {
        captureJob?.cancel()
        captureJob = null
        val record = audioRecord
        audioRecord = null
        try {
            record?.stop()
        } catch (e: Exception) {
            Log.e(TAG, "AudioRecord stop exception", e)
        }
        result.success(null)
    }

    // ── Playback implementation ───────────────────────────────────────────
    private fun startPlayback(result: MethodChannel.Result) {
        stopPlaybackInternal()

        val minBuf = AudioTrack.getMinBufferSize(SAMPLE_RATE, CHANNEL_OUT, AUDIO_FORMAT)
        // 500 ms buffer to absorb Wi-Fi jitter
        val bufSize = maxOf(minBuf, SAMPLE_RATE * 2 / 2)
        Log.d(TAG, "startPlayback: minBuf=$minBuf bufSize=$bufSize")

        val track = AudioTrack(
            AudioManager.STREAM_MUSIC,   // Routes to loudspeaker (VOICE_CALL uses earpiece)
            SAMPLE_RATE,
            CHANNEL_OUT,
            AUDIO_FORMAT,
            bufSize,
            AudioTrack.MODE_STREAM
        )

        if (track.state != AudioTrack.STATE_INITIALIZED) {
            Log.e(TAG, "AudioTrack init failed")
            result.error("INIT_ERROR", "AudioTrack init failed", null)
            return
        }

        track.play()
        audioTrack = track
        Log.d(TAG, "AudioTrack playing")
        
        val channel = Channel<ByteArray>(Channel.UNLIMITED)
        playbackChannel = channel

        playbackJob = scope.launch(Dispatchers.IO) {
            try {
                for (chunk in channel) {
                    track.write(chunk, 0, chunk.size)
                }
            } catch (e: Exception) {
                Log.e(TAG, "AudioTrack write exception", e)
            } finally {
                try {
                    track.release()
                } catch (e: Exception) {
                    Log.e(TAG, "AudioTrack release exception", e)
                }
            }
        }

        result.success(null)
    }

    private fun playChunk(data: ByteArray, result: MethodChannel.Result) {
        val channel = playbackChannel
        if (channel == null || channel.isClosedForSend) {
            Log.w(TAG, "playChunk: channel not ready, dropping ${data.size} bytes")
            result.success(null)
            return
        }
        channel.trySend(data)
        result.success(null)
    }

    private fun stopPlayback(result: MethodChannel.Result) {
        stopPlaybackInternal()
        result.success(null)
    }

    private fun stopPlaybackInternal() {
        playbackChannel?.close()
        playbackChannel = null
        playbackJob?.cancel()
        playbackJob = null
        val track = audioTrack
        audioTrack = null
        try {
            track?.stop()
        } catch (e: Exception) {
            Log.e(TAG, "AudioTrack stop exception", e)
        }
    }

    fun dispose() {
        captureJob?.cancel()
        val record = audioRecord
        audioRecord = null
        try {
            record?.stop()
        } catch (e: Exception) {}
        stopPlaybackInternal()
    }
}
