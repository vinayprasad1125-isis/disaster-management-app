import 'dart:async';
import '../../../../core/constants/asset_constants.dart';
import '../../data/models/nearby_device.dart';
import '../../data/models/emergency_message.dart';
import '../../data/models/communication_session.dart';
import '../../data/models/communication_enums.dart';
import '../../domain/repositories/communication_repository.dart';

class MockCommunicationRepository implements CommunicationRepository {
  final List<NearbyDevice> _mockDevices = [
    const NearbyDevice(
      id: 'dev_1',
      name: 'John Doe',
      avatarUrl: AssetConstants.userPlaceholder,
      approximateDistanceMeters: 15.0,
      connectionType: ConnectionType.bluetooth,
      signalStrength: SignalStrength.good,
      status: ConnectionStatus.disconnected,
    ),
    const NearbyDevice(
      id: 'dev_2',
      name: 'Sarah Smith',
      avatarUrl: AssetConstants.userPlaceholder,
      approximateDistanceMeters: 5.0,
      connectionType: ConnectionType.wifiDirect,
      signalStrength: SignalStrength.excellent,
      status: ConnectionStatus.connected,
    ),
    const NearbyDevice(
      id: 'dev_3',
      name: 'Neighbor Mike',
      avatarUrl: AssetConstants.userPlaceholder,
      approximateDistanceMeters: 45.0,
      connectionType: ConnectionType.bluetooth,
      signalStrength: SignalStrength.weak,
      status: ConnectionStatus.disconnected,
    ),
  ];

  @override
  Stream<List<NearbyDevice>> scanForDevices() async* {
    yield [];
    await Future.delayed(const Duration(seconds: 2));
    yield [_mockDevices[0]];
    await Future.delayed(const Duration(seconds: 2));
    yield [_mockDevices[0], _mockDevices[1]];
    await Future.delayed(const Duration(seconds: 1));
    yield _mockDevices;
  }

  @override
  Future<void> stopScanning() async {
    // Mock stop
  }

  @override
  Future<bool> connectToDevice(String deviceId) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future<void> disconnectFromDevice(String deviceId) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<EmergencyMessage> sendMessage(EmergencyMessage message) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return message.copyWith(status: MessageDeliveryStatus.delivered);
  }

  @override
  Stream<EmergencyMessage> receiveMessages(String deviceId) async* {
    // Mock incoming message
    await Future.delayed(const Duration(seconds: 5));
    yield EmergencyMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: 'Are you okay? I have water.',
      senderId: deviceId,
      receiverId: 'me',
      timestamp: DateTime.now(),
      status: MessageDeliveryStatus.delivered,
    );
  }

  @override
  Future<CommunicationSession> initiateCall(String deviceId) async {
    await Future.delayed(const Duration(seconds: 2));
    final device = _mockDevices.firstWhere((d) => d.id == deviceId);
    return CommunicationSession(
      sessionId: DateTime.now().millisecondsSinceEpoch.toString(),
      peerDevice: device,
      startTime: DateTime.now(),
      callState: CallState.active,
    );
  }

  @override
  Stream<CommunicationSession> incomingCalls() async* {
    // Simulate incoming call after a while
    await Future.delayed(const Duration(seconds: 15));
    yield CommunicationSession(
      sessionId: 'inc_call_1',
      peerDevice: _mockDevices[2],
      startTime: DateTime.now(),
      callState: CallState.incoming,
    );
  }

  @override
  Future<void> endCall(String sessionId) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
