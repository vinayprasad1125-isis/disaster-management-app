import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'audio_capture_service.dart';
import 'audio_playback_service.dart';
import 'nearby_connection_service.dart';

class AudioStreamingService {
  final AudioCaptureService _captureService;
  final AudioPlaybackService _playbackService;
  final NearbyConnectionService _connectionService;

  bool _isTransmitting = false;

  AudioStreamingService({
    required AudioCaptureService captureService,
    required AudioPlaybackService playbackService,
    required NearbyConnectionService connectionService,
  })  : _captureService = captureService,
        _playbackService = playbackService,
        _connectionService = connectionService {
    // Wire up the capture to send via nearby connections
    _captureService.onAudioPacketCaptured = (Uint8List data) {
      if (data.isEmpty) return;
      if (_isTransmitting && _activeEndpointIds.isNotEmpty) {
        debugPrint('[Streaming] Sending chunk: ${data.length} bytes to ${_activeEndpointIds.length} endpoints');
        for (var id in _activeEndpointIds) {
          _connectionService.sendBytesPayload(id, data);
        }
      }
    };
    
    // Initialize the player and recorder immediately to grab the audio session early,
    // avoiding native crashes and latency.
    _playbackService.init();
    _captureService.init();
  }
  
  List<String> _activeEndpointIds = [];

  void transmitAudio(List<String> endpointIds) {
    _activeEndpointIds = endpointIds;
  }

  Future<void> startTransmission() async {
    _isTransmitting = true;
    await _captureService.startRecording();
  }

  Future<void> stopTransmission() async {
    _isTransmitting = false;
    await _captureService.stopRecording();
    
    // Send a 1-byte control packet to tell receivers to stop playback stream
    for (var id in _activeEndpointIds) {
      _connectionService.sendBytesPayload(id, Uint8List.fromList([0]));
    }
  }

  Future<void> startReceiving() async {
    await _playbackService.startPlayingStream();
  }

  Future<void> receiveAudioPacket(Uint8List data) async {
    if (data.isEmpty) return;
    debugPrint('[Streaming] receiveAudioPacket: ${data.length} bytes');
    
    // If we receive our 1-byte control packet, stop the stream
    if (data.length == 1 && data[0] == 0) {
      await _playbackService.stopPlayingStream();
      return;
    }
    
    // If not already playing, start the stream
    if (!_playbackService.isPlaying) {
      await _playbackService.startPlayingStream();
    }
    
    await _playbackService.playAudioPacket(data);
  }

  Future<void> stopReceiving() async {
    await _playbackService.stopPlayingStream();
  }

  void dispose() {
    _captureService.dispose();
    _playbackService.dispose();
  }
}
