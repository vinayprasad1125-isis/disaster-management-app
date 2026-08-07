import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Captures PCM-16 audio via native Android AudioRecord over a MethodChannel/EventChannel.
/// Bypasses flutter_sound entirely to avoid the buzzing/distortion bug.
class AudioCaptureService {
  static const _eventChannel = EventChannel('com.disasterapp/audio_stream');
  static const _methodChannel = MethodChannel('com.disasterapp/audio');

  StreamSubscription? _sub;
  Function(Uint8List)? onAudioPacketCaptured;

  Future<bool> hasPermission() async {
    // Permission already handled by permission_handler in the provider layer
    return true;
  }

  Future<void> init() async {
    // No-op: native side initialises on startCapture
  }

  Future<void> startRecording() async {
    await _methodChannel.invokeMethod('startCapture');
    debugPrint('[AudioCapture] startCapture sent to native');

    // Subscribe to the event stream of raw PCM bytes from native
    _sub = _eventChannel.receiveBroadcastStream().listen((dynamic data) {
      if (data is Uint8List && data.isNotEmpty) {
        debugPrint('[AudioCapture] got chunk: ${data.length} bytes');
        onAudioPacketCaptured?.call(data);
      }
    }, onError: (e) {
      debugPrint('[AudioCapture] stream error: $e');
    });
  }

  Future<void> stopRecording() async {
    await _sub?.cancel();
    _sub = null;
    await _methodChannel.invokeMethod('stopCapture');
  }

  void dispose() {
    _sub?.cancel();
    _sub = null;
    _methodChannel.invokeMethod('stopCapture').catchError((_) {});
  }
}
