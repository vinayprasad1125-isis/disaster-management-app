import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'walkie_talkie_providers.dart';
import 'connection_provider.dart';
import '../models/enums.dart';

class WalkieTalkieNotifier extends StateNotifier<WalkieTalkieStatus> {
  final Ref _ref;

  WalkieTalkieNotifier(this._ref) : super(WalkieTalkieStatus.idle) {
    _initAudioStreaming();
  }

  void _initAudioStreaming() {
    // When connected, we should automatically start receiving
    _ref.listen(connectionProvider, (previous, next) {
      if (next.status == DeviceStatus.connected && previous?.status != DeviceStatus.connected) {
        state = WalkieTalkieStatus.listening;
      } else if (next.status == DeviceStatus.disconnected) {
        state = WalkieTalkieStatus.idle;
      }
    });
  }

  Future<void> startTransmitting() async {
    final connectionState = _ref.read(connectionProvider);
    if (connectionState.status == DeviceStatus.connected && connectionState.connectedDevice != null) {
      state = WalkieTalkieStatus.transmitting;
      
      final streamingService = _ref.read(audioStreamingServiceProvider);
      
      // Force stop playback immediately before we start recording 
      // to avoid native audio track conflicts and acoustic feedback.
      await streamingService.stopReceiving();
      
      // Tell service which endpoint to send to
      streamingService.transmitAudio([connectionState.connectedDevice!.id]);
      await streamingService.startTransmission();
    }
  }

  Future<void> stopTransmitting() async {
    if (state == WalkieTalkieStatus.transmitting) {
      await _ref.read(audioStreamingServiceProvider).stopTransmission();
      
      final connectionState = _ref.read(connectionProvider);
      if (connectionState.status == DeviceStatus.connected) {
        state = WalkieTalkieStatus.listening;
      } else {
        state = WalkieTalkieStatus.idle;
      }
    }
  }
}

final walkieTalkieProvider = StateNotifierProvider<WalkieTalkieNotifier, WalkieTalkieStatus>((ref) {
  return WalkieTalkieNotifier(ref);
});
