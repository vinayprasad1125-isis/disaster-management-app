import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Plays PCM-16 audio chunks via native Android AudioTrack over a MethodChannel.
/// Bypasses flutter_sound entirely to avoid the buzzing/distortion bug.
class AudioPlaybackService {
  static const _methodChannel = MethodChannel('com.disasterapp/audio');

  bool _isPlaying = false;
  bool _isStarting = false;
  bool get isPlaying => _isPlaying;

  Future<void> init() async {
    // No-op: native side initialises on startPlayback
  }

  Future<void> startPlayingStream() async {
    if (_isPlaying || _isStarting) return;
    _isStarting = true;
    debugPrint('[AudioPlayback] startPlayback sent to native');
    try {
      await _methodChannel.invokeMethod('startPlayback');
      _isPlaying = true;
    } finally {
      _isStarting = false;
    }
  }

  Future<void> playAudioPacket(Uint8List data) async {
    if (!_isPlaying || data.isEmpty) return;
    debugPrint('[AudioPlayback] playChunk: ${data.length} bytes');
    await _methodChannel.invokeMethod('playChunk', {'data': data});
  }

  Future<void> stopPlayingStream() async {
    if (!_isPlaying) return;
    _isPlaying = false;
    await _methodChannel.invokeMethod('stopPlayback');
  }

  void dispose() {
    _isPlaying = false;
    _methodChannel.invokeMethod('stopPlayback').catchError((_) {});
  }
}
