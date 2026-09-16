import '../../data/models/nearby_device.dart';
import '../../data/models/emergency_message.dart';
import '../../data/models/communication_session.dart';

abstract class CommunicationRepository {
  /// Start scanning for nearby devices using Bluetooth or Wi-Fi Direct
  Stream<List<NearbyDevice>> scanForDevices();

  /// Stop scanning
  Future<void> stopScanning();

  /// Attempt to connect to a specific device
  Future<bool> connectToDevice(String deviceId);

  /// Disconnect from a device
  Future<void> disconnectFromDevice(String deviceId);

  /// Send a chat message over the offline mesh
  Future<EmergencyMessage> sendMessage(EmergencyMessage message);

  /// Listen for incoming chat messages
  Stream<EmergencyMessage> receiveMessages(String deviceId);

  /// Initiate an emergency voice call
  Future<CommunicationSession> initiateCall(String deviceId);

  /// Listen for incoming voice calls
  Stream<CommunicationSession> incomingCalls();

  /// End an active voice call
  Future<void> endCall(String sessionId);
}
