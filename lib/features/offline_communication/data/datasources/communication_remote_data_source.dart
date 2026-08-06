import '../models/nearby_device.dart';

/// Abstract class representing the actual hardware layer (Bluetooth/Wi-Fi Direct)
abstract class CommunicationRemoteDataSource {
  Stream<List<NearbyDevice>> discoverPeers();
  Future<void> connect(String address);
  Future<void> disconnect(String address);
  Future<void> transmitData(String address, Map<String, dynamic> payload);
  Stream<Map<String, dynamic>> receiveData(String address);
}
