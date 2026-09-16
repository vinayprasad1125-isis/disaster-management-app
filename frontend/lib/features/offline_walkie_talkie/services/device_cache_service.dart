import '../repositories/walkie_talkie_repository.dart';
import '../models/nearby_device.dart';

class DeviceCacheService {
  final WalkieTalkieRepository _repository;

  DeviceCacheService(this._repository);

  Future<void> cacheDevice(NearbyDevice device) async {
    await _repository.cacheDevice(device);
  }

  Future<NearbyDevice?> getDevice(String endpointId) async {
    return await _repository.getCachedDevice(endpointId);
  }

  Future<List<NearbyDevice>> getRecentDevices() async {
    return await _repository.getRecentDevices();
  }
}
