import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/nearby_device.dart';
import '../models/communication_session.dart';
import '../models/emergency_message.dart';

class WalkieTalkieLocalDatasource {
  static const String _devicesBoxName = 'walkie_talkie_devices';
  static const String _historyBoxName = 'walkie_talkie_history';
  static const String _messagesBoxName = 'walkie_talkie_messages';

  late Box<String> _devicesBox;
  late Box<String> _historyBox;
  late Box<String> _messagesBox;

  Future<void> init() async {
    _devicesBox = await Hive.openBox<String>(_devicesBoxName);
    _historyBox = await Hive.openBox<String>(_historyBoxName);
    _messagesBox = await Hive.openBox<String>(_messagesBoxName);
  }

  // Device Caching
  Future<void> saveDevice(NearbyDevice device) async {
    await _devicesBox.put(device.id, jsonEncode(device.toJson()));
  }

  Future<NearbyDevice?> getDevice(String id) async {
    final data = _devicesBox.get(id);
    if (data != null) {
      return NearbyDevice.fromJson(jsonDecode(data));
    }
    return null;
  }

  Future<List<NearbyDevice>> getAllCachedDevices() async {
    return _devicesBox.values
        .map((data) => NearbyDevice.fromJson(jsonDecode(data)))
        .toList();
  }

  // Session History
  Future<void> saveSession(CommunicationSession session) async {
    await _historyBox.put(session.sessionId, jsonEncode(session.toJson()));
  }

  Future<List<CommunicationSession>> getCallHistory() async {
    final sessions = _historyBox.values
        .map((data) => CommunicationSession.fromJson(jsonDecode(data)))
        .toList();
    // Sort by start time descending
    sessions.sort((a, b) => b.startTime.compareTo(a.startTime));
    return sessions;
  }

  // Emergency Messages
  Future<void> saveEmergencyMessage(EmergencyMessage message) async {
    await _messagesBox.put(message.messageId, jsonEncode(message.toJson()));
  }

  Future<List<EmergencyMessage>> getEmergencyMessages() async {
    final messages = _messagesBox.values
        .map((data) => EmergencyMessage.fromJson(jsonDecode(data)))
        .toList();
    messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return messages;
  }
}
