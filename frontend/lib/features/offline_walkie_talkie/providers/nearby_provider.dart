import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'walkie_talkie_providers.dart';
import '../models/nearby_device.dart';

// State definition
class NearbyState {
  final bool isAdvertising;
  final bool isDiscovering;
  final List<NearbyDevice> discoveredDevices;

  NearbyState({
    this.isAdvertising = false,
    this.isDiscovering = false,
    this.discoveredDevices = const [],
  });

  NearbyState copyWith({
    bool? isAdvertising,
    bool? isDiscovering,
    List<NearbyDevice>? discoveredDevices,
  }) {
    return NearbyState(
      isAdvertising: isAdvertising ?? this.isAdvertising,
      isDiscovering: isDiscovering ?? this.isDiscovering,
      discoveredDevices: discoveredDevices ?? this.discoveredDevices,
    );
  }
}

// Notifier
class NearbyNotifier extends StateNotifier<NearbyState> {
  final Ref _ref;

  NearbyNotifier(this._ref) : super(NearbyState()) {
    _initDiscoveryService();
  }

  void _initDiscoveryService() {
    final discoveryService = _ref.read(nearbyDiscoveryServiceProvider);
    
    discoveryService.onDeviceDiscovered = (device) {
      if (!state.discoveredDevices.any((d) => d.id == device.id)) {
        state = state.copyWith(
          discoveredDevices: [...state.discoveredDevices, device],
        );
      }
    };

    discoveryService.onDeviceLost = (id) {
      state = state.copyWith(
        discoveredDevices: state.discoveredDevices.where((d) => d.id != id).toList(),
      );
    };
  }

  Future<void> toggleAdvertising(String userName) async {
    final service = _ref.read(nearbyDiscoveryServiceProvider);
    if (state.isAdvertising) {
      await service.stopAdvertising();
      state = state.copyWith(isAdvertising: false);
    } else {
      bool success = await service.startAdvertising(userName);
      state = state.copyWith(isAdvertising: success);
    }
  }

  Future<void> toggleDiscovery(String userName) async {
    final service = _ref.read(nearbyDiscoveryServiceProvider);
    if (state.isDiscovering) {
      await service.stopDiscovery();
      state = state.copyWith(isDiscovering: false, discoveredDevices: []);
    } else {
      bool success = await service.startDiscovery(userName);
      state = state.copyWith(isDiscovering: success);
    }
  }
}

final nearbyProvider = StateNotifierProvider<NearbyNotifier, NearbyState>((ref) {
  return NearbyNotifier(ref);
});
