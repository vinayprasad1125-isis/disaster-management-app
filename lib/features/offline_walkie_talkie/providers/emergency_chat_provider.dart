import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'walkie_talkie_providers.dart';
import 'connection_provider.dart';
import '../models/emergency_message.dart';

class EmergencyChatNotifier extends StateNotifier<List<EmergencyMessage>> {
  final Ref _ref;
  final Uuid _uuid = const Uuid();

  EmergencyChatNotifier(this._ref) : super([]) {
    _loadHistory();
    _listenForIncomingMessages();
  }

  Future<void> _loadHistory() async {
    final repo = _ref.read(walkieTalkieRepositoryProvider);
    state = await repo.getEmergencyMessages();
  }

  void _listenForIncomingMessages() {
     final connService = _ref.read(nearbyConnectionServiceProvider);
     // Note: In a real implementation, we would differentiate between audio BYTES and message BYTES.
     // For this offline walkie talkie, we could prefix JSON messages or use separate nearby payloads.
     // We will leave this abstract or assume JSON decode try-catch logic here.
  }

  Future<void> sendEmergencyMessage(String messageType) async {
    final connectionState = _ref.read(connectionProvider);
    if (connectionState.status != DeviceStatus.connected || connectionState.connectedDevice == null) {
      return;
    }

    final locService = _ref.read(locationServiceProvider);
    final pos = await locService.getCurrentLocation();

    final msg = EmergencyMessage(
      messageId: _uuid.v4(),
      senderId: 'me', // Usually this device's ID or user ID
      receiverId: connectionState.connectedDevice!.id,
      messageType: messageType,
      timestamp: DateTime.now(),
      latitude: pos?.latitude,
      longitude: pos?.longitude,
    );

    // Save locally
    await _ref.read(walkieTalkieRepositoryProvider).saveEmergencyMessage(msg);
    state = [msg, ...state];

    // Send over nearby
    final jsonStr = jsonEncode(msg.toJson());
    final bytes = Uint8List.fromList(utf8.encode('MSG:$jsonStr'));
    await _ref.read(nearbyConnectionServiceProvider).sendBytesPayload(connectionState.connectedDevice!.id, bytes);
  }
}

final emergencyChatProvider = StateNotifierProvider<EmergencyChatNotifier, List<EmergencyMessage>>((ref) {
  return EmergencyChatNotifier(ref);
});
