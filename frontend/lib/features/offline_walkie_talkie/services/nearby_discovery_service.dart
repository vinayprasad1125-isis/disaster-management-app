import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:nearby_connections/nearby_connections.dart';
import '../models/nearby_device.dart';
import '../models/enums.dart';

class NearbyDiscoveryService {
  final Strategy strategy = Strategy.P2P_CLUSTER;
  
  // Callbacks
  Function(NearbyDevice)? onDeviceDiscovered;
  Function(String)? onDeviceLost;
  
  Function(String, ConnectionInfo)? onConnectionInitiated;
  Function(String, Status)? onConnectionResult;
  Function(String)? onDisconnected;
  
  bool _isDiscovering = false;
  bool _isAdvertising = false;

  Future<bool> startAdvertising(String userName) async {
    if (_isAdvertising) return true;
    try {
      bool result = await Nearby().startAdvertising(
        userName,
        strategy,
        onConnectionInitiated: (String id, ConnectionInfo info) {
          if (onConnectionInitiated != null) onConnectionInitiated!(id, info);
        },
        onConnectionResult: (String id, Status status) {
          if (onConnectionResult != null) onConnectionResult!(id, status);
        },
        onDisconnected: (String id) {
          if (onDisconnected != null) onDisconnected!(id);
        },
      );
      _isAdvertising = result;
      return result;
    } catch (e) {
      debugPrint('Error starting advertising: $e');
      return false;
    }
  }

  Future<void> stopAdvertising() async {
    await Nearby().stopAdvertising();
    _isAdvertising = false;
  }

  Future<bool> startDiscovery(String userName) async {
    if (_isDiscovering) return true;
    try {
      bool result = await Nearby().startDiscovery(
        userName,
        strategy,
        onEndpointFound: (String id, String name, String serviceId) {
          if (onDeviceDiscovered != null) {
            final device = NearbyDevice(
              id: id,
              name: name,
              status: DeviceStatus.discovered,
              connectionType: ConnectionType.wifiDirect, // Nearby uses a mix, we default to showing wifiDirect/ble
            );
            onDeviceDiscovered!(device);
          }
        },
        onEndpointLost: (String? id) {
          if (onDeviceLost != null && id != null) {
            onDeviceLost!(id);
          }
        },
      );
      _isDiscovering = result;
      return result;
    } catch (e) {
      debugPrint('Error starting discovery: $e');
      return false;
    }
  }

  Future<void> stopDiscovery() async {
    await Nearby().stopDiscovery();
    _isDiscovering = false;
  }
}
