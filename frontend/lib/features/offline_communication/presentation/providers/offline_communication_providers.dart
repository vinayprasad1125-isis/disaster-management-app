import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/mock_communication_repository.dart';
import '../../domain/repositories/communication_repository.dart';
import '../../data/models/nearby_device.dart';
import '../../data/models/communication_enums.dart';

final communicationRepositoryProvider = Provider<CommunicationRepository>((
  ref,
) {
  return MockCommunicationRepository();
});

final nearbyDevicesProvider = StreamProvider<List<NearbyDevice>>((ref) {
  final repo = ref.watch(communicationRepositoryProvider);
  return repo.scanForDevices();
});

// A provider to manage the connection state for a specific device
final connectionStateProvider = StateProvider.family<ConnectionStatus, String>((
  ref,
  deviceId,
) {
  // Hardcoded for mock purpose: dev_2 is already connected.
  if (deviceId == 'dev_2') return ConnectionStatus.connected;
  return ConnectionStatus.disconnected;
});

// A notifier to manage connecting logic
class ConnectionNotifier extends StateNotifier<void> {
  final Ref ref;
  ConnectionNotifier(this.ref) : super(null);

  Future<void> connect(String deviceId) async {
    ref.read(connectionStateProvider(deviceId).notifier).state =
        ConnectionStatus.connecting;
    final repo = ref.read(communicationRepositoryProvider);
    final success = await repo.connectToDevice(deviceId);
    ref.read(connectionStateProvider(deviceId).notifier).state = success
        ? ConnectionStatus.connected
        : ConnectionStatus.failed;
  }

  Future<void> disconnect(String deviceId) async {
    final repo = ref.read(communicationRepositoryProvider);
    await repo.disconnectFromDevice(deviceId);
    ref.read(connectionStateProvider(deviceId).notifier).state =
        ConnectionStatus.disconnected;
  }
}

final connectionNotifierProvider = Provider((ref) => ConnectionNotifier(ref));
