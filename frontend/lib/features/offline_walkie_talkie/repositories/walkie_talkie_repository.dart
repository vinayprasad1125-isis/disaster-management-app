import '../datasources/walkie_talkie_local_datasource.dart';
import '../models/nearby_device.dart';
import '../models/communication_session.dart';
import '../models/emergency_message.dart';

class WalkieTalkieRepository {
  final WalkieTalkieLocalDatasource _localDatasource;

  WalkieTalkieRepository(this._localDatasource);

  // Initialization
  Future<void> init() async {
    await _localDatasource.init();
  }

  // Devices
  Future<void> cacheDevice(NearbyDevice device) async {
    await _localDatasource.saveDevice(device);
  }

  Future<NearbyDevice?> getCachedDevice(String id) async {
    return await _localDatasource.getDevice(id);
  }

  Future<List<NearbyDevice>> getRecentDevices() async {
    return await _localDatasource.getAllCachedDevices();
  }

  // History
  Future<void> saveCallSession(CommunicationSession session) async {
    await _localDatasource.saveSession(session);
  }

  Future<List<CommunicationSession>> getCallHistory() async {
    return await _localDatasource.getCallHistory();
  }

  // Messages
  Future<void> saveEmergencyMessage(EmergencyMessage message) async {
    await _localDatasource.saveEmergencyMessage(message);
  }

  Future<List<EmergencyMessage>> getEmergencyMessages() async {
    return await _localDatasource.getEmergencyMessages();
  }
}
