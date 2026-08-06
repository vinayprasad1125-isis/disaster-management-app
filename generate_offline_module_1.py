import os

base_dir = "lib/features/offline_communication"
models_dir = os.path.join(base_dir, "data/models")
repos_dir = os.path.join(base_dir, "domain/repositories")
ds_dir = os.path.join(base_dir, "data/datasources")

os.makedirs(models_dir, exist_ok=True)
os.makedirs(repos_dir, exist_ok=True)
os.makedirs(ds_dir, exist_ok=True)

# 1. ENUMS
enums_content = """enum ConnectionType {
  bluetooth,
  wifiDirect
}

enum ConnectionStatus {
  disconnected,
  connecting,
  connected,
  failed
}

enum SignalStrength {
  weak,
  fair,
  good,
  excellent
}

enum CallState {
  idle,
  incoming,
  outgoing,
  active,
  ended
}

enum MessageDeliveryStatus {
  sending,
  sent,
  delivered,
  failed
}
"""

with open(os.path.join(models_dir, "communication_enums.dart"), "w") as f:
    f.write(enums_content)

# 2. NEARBY DEVICE MODEL
device_content = """import 'package:freezed_annotation/freezed_annotation.dart';
import 'communication_enums.dart';

part 'nearby_device.freezed.dart';
part 'nearby_device.g.dart';

@freezed
class NearbyDevice with _$NearbyDevice {
  const factory NearbyDevice({
    required String id,
    required String name,
    required String avatarUrl,
    required double approximateDistanceMeters,
    required ConnectionType connectionType,
    required SignalStrength signalStrength,
    required ConnectionStatus status,
  }) = _NearbyDevice;

  factory NearbyDevice.fromJson(Map<String, dynamic> json) => _$NearbyDeviceFromJson(json);
}
"""

with open(os.path.join(models_dir, "nearby_device.dart"), "w") as f:
    f.write(device_content)

# 3. COMMUNICATION SESSION MODEL
session_content = """import 'package:freezed_annotation/freezed_annotation.dart';
import 'communication_enums.dart';
import 'nearby_device.dart';

part 'communication_session.freezed.dart';
part 'communication_session.g.dart';

@freezed
class CommunicationSession with _$CommunicationSession {
  const factory CommunicationSession({
    required String sessionId,
    required NearbyDevice peerDevice,
    required DateTime startTime,
    DateTime? endTime,
    required CallState callState,
  }) = _CommunicationSession;

  factory CommunicationSession.fromJson(Map<String, dynamic> json) => _$CommunicationSessionFromJson(json);
}
"""

with open(os.path.join(models_dir, "communication_session.dart"), "w") as f:
    f.write(session_content)

# 4. EMERGENCY MESSAGE MODEL
message_content = """import 'package:freezed_annotation/freezed_annotation.dart';
import 'communication_enums.dart';

part 'emergency_message.freezed.dart';
part 'emergency_message.g.dart';

@freezed
class EmergencyMessage with _$EmergencyMessage {
  const factory EmergencyMessage({
    required String id,
    required String text,
    required String senderId,
    required String receiverId,
    required DateTime timestamp,
    required MessageDeliveryStatus status,
  }) = _EmergencyMessage;

  factory EmergencyMessage.fromJson(Map<String, dynamic> json) => _$EmergencyMessageFromJson(json);
}
"""

with open(os.path.join(models_dir, "emergency_message.dart"), "w") as f:
    f.write(message_content)

# 5. REPOSITORY INTERFACE
repo_content = """import '../data/models/nearby_device.dart';
import '../data/models/emergency_message.dart';
import '../data/models/communication_session.dart';

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
"""

with open(os.path.join(repos_dir, "communication_repository.dart"), "w") as f:
    f.write(repo_content)

# 6. DATA SOURCES INTERFACES
remote_ds_content = """import '../models/nearby_device.dart';
import '../models/emergency_message.dart';

/// Abstract class representing the actual hardware layer (Bluetooth/Wi-Fi Direct)
abstract class CommunicationRemoteDataSource {
  Stream<List<NearbyDevice>> discoverPeers();
  Future<void> connect(String address);
  Future<void> disconnect(String address);
  Future<void> transmitData(String address, Map<String, dynamic> payload);
  Stream<Map<String, dynamic>> receiveData(String address);
}
"""

with open(os.path.join(ds_dir, "communication_remote_data_source.dart"), "w") as f:
    f.write(remote_ds_content)

local_ds_content = """import '../models/emergency_message.dart';
import '../models/communication_session.dart';

/// Abstract class representing local storage for offline chats and call history
abstract class CommunicationLocalDataSource {
  Future<void> saveMessage(EmergencyMessage message);
  Future<List<EmergencyMessage>> getChatHistory(String peerId);
  Future<void> saveCallSession(CommunicationSession session);
  Future<List<CommunicationSession>> getCallHistory();
}
"""

with open(os.path.join(ds_dir, "communication_local_data_source.dart"), "w") as f:
    f.write(local_ds_content)
