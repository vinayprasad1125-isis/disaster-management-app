import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'walkie_talkie_providers.dart';
import '../models/nearby_device.dart';
import '../models/enums.dart';

class ConnectionStateData {
  final NearbyDevice? connectedDevice;
  final DeviceStatus status;
  final String? incomingConnectionEndpointId;
  final String? incomingConnectionName;

  ConnectionStateData({
    this.connectedDevice,
    this.status = DeviceStatus.disconnected,
    this.incomingConnectionEndpointId,
    this.incomingConnectionName,
  });

  ConnectionStateData copyWith({
    NearbyDevice? connectedDevice,
    DeviceStatus? status,
    String? incomingConnectionEndpointId,
    String? incomingConnectionName,
  }) {
    return ConnectionStateData(
      connectedDevice: connectedDevice ?? this.connectedDevice,
      status: status ?? this.status,
      incomingConnectionEndpointId: incomingConnectionEndpointId ?? this.incomingConnectionEndpointId,
      incomingConnectionName: incomingConnectionName ?? this.incomingConnectionName,
    );
  }
}

class ConnectionNotifier extends StateNotifier<ConnectionStateData> {
  final Ref _ref;

  ConnectionNotifier(this._ref) : super(ConnectionStateData()) {
    _initConnectionService();
  }

  void _initConnectionService() {
    final connService = _ref.read(nearbyConnectionServiceProvider);
    final discoveryService = _ref.read(nearbyDiscoveryServiceProvider);
    
    final onInit = (String id, ConnectionInfo info) {
      if (info.isIncomingConnection) {
        // Prompt user to accept/reject
        state = state.copyWith(
          incomingConnectionEndpointId: id,
          incomingConnectionName: info.endpointName,
          status: DeviceStatus.connecting,
        );
      } else {
        // Auto-accept if we initiated the connection
        connService.acceptConnection(id);
      }
    };
    
    connService.onConnectionInitiated = onInit;
    discoveryService.onConnectionInitiated = onInit;

    final onResult = (String id, Status status) {
      if (status == Status.CONNECTED) {
        // Find device info from incoming connection name
        final name = state.incomingConnectionName ?? 'Unknown Device';
        final device = NearbyDevice(id: id, name: name, status: DeviceStatus.connected);
        // Stop discovery and advertising to save bandwidth
        discoveryService.stopDiscovery();
        discoveryService.stopAdvertising();
        
        state = state.copyWith(
          connectedDevice: device,
          status: DeviceStatus.connected,
          incomingConnectionEndpointId: null,
          incomingConnectionName: null,
        );
      } else {
        state = state.copyWith(
          status: DeviceStatus.disconnected,
          incomingConnectionEndpointId: null,
          incomingConnectionName: null,
        );
      }
    };
    
    connService.onConnectionResult = onResult;
    discoveryService.onConnectionResult = onResult;

    final onDisconnect = (String id) {
      if (state.connectedDevice?.id == id) {
        state = state.copyWith(
          connectedDevice: null,
          status: DeviceStatus.disconnected,
        );
      }
    };
    
    connService.onDisconnected = onDisconnect;
    discoveryService.onDisconnected = onDisconnect;
    
    connService.onPayloadReceived = (id, payload) {
      // Forward payloads to appropriate services (Audio, Chat)
      if (payload.type == PayloadType.BYTES) {
        final bytes = payload.bytes;
        if (bytes != null) {
          // Send to AudioStreamingService
          _ref.read(audioStreamingServiceProvider).receiveAudioPacket(bytes);
        }
      }
    };
  }

  Future<void> requestConnection(String userName, String endpointId) async {
    state = state.copyWith(status: DeviceStatus.connecting);
    await _ref.read(nearbyConnectionServiceProvider).requestConnection(userName, endpointId);
  }

  Future<void> acceptConnection() async {
    if (state.incomingConnectionEndpointId != null) {
      await _ref.read(nearbyConnectionServiceProvider).acceptConnection(state.incomingConnectionEndpointId!);
    }
  }

  Future<void> rejectConnection() async {
    if (state.incomingConnectionEndpointId != null) {
      await _ref.read(nearbyConnectionServiceProvider).rejectConnection(state.incomingConnectionEndpointId!);
      state = state.copyWith(
        status: DeviceStatus.disconnected,
        incomingConnectionEndpointId: null,
        incomingConnectionName: null,
      );
    }
  }

  Future<void> disconnect() async {
    if (state.connectedDevice != null) {
      await _ref.read(nearbyConnectionServiceProvider).disconnectFromEndpoint(state.connectedDevice!.id);
      state = state.copyWith(
        connectedDevice: null,
        status: DeviceStatus.disconnected,
      );
    }
  }
}

final connectionProvider = StateNotifierProvider<ConnectionNotifier, ConnectionStateData>((ref) {
  return ConnectionNotifier(ref);
});
