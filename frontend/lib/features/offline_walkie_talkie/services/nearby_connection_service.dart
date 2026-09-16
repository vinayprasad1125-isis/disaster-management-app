import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:nearby_connections/nearby_connections.dart';

class NearbyConnectionService {
  Function(String endpointId, ConnectionInfo info)? onConnectionInitiated;
  Function(String endpointId, Status status)? onConnectionResult;
  Function(String endpointId)? onDisconnected;
  Function(String endpointId, Payload payload)? onPayloadReceived;

  Future<void> requestConnection(String userName, String endpointId) async {
    try {
      await Nearby().requestConnection(
        userName,
        endpointId,
        onConnectionInitiated: (id, info) {
          if (onConnectionInitiated != null) onConnectionInitiated!(id, info);
        },
        onConnectionResult: (id, status) {
          if (onConnectionResult != null) onConnectionResult!(id, status);
        },
        onDisconnected: (id) {
          if (onDisconnected != null) onDisconnected!(id);
        },
      );
    } catch (e) {
      debugPrint('Error requesting connection: $e');
    }
  }

  Future<void> acceptConnection(String endpointId) async {
    try {
      await Nearby().acceptConnection(
        endpointId,
        onPayLoadRecieved: (id, payload) {
          if (onPayloadReceived != null) onPayloadReceived!(id, payload);
        },
        onPayloadTransferUpdate: (id, payloadTransferUpdate) {
          // Handle transfer updates if needed (e.g., for large files)
        },
      );
    } catch (e) {
      debugPrint('Error accepting connection: $e');
    }
  }

  Future<void> rejectConnection(String endpointId) async {
    try {
      await Nearby().rejectConnection(endpointId);
    } catch (e) {
      debugPrint('Error rejecting connection: $e');
    }
  }

  Future<void> disconnectFromEndpoint(String endpointId) async {
    try {
      await Nearby().disconnectFromEndpoint(endpointId);
    } catch (e) {
      debugPrint('Error disconnecting: $e');
    }
  }
  
  Future<void> stopAllEndpoints() async {
    try {
      await Nearby().stopAllEndpoints();
    } catch(e) {
      debugPrint('Error stopping endpoints: $e');
    }
  }

  Future<void> sendBytesPayload(String endpointId, Uint8List bytes) async {
    try {
      await Nearby().sendBytesPayload(endpointId, bytes);
    } catch (e) {
      debugPrint('Error sending bytes payload: $e');
    }
  }
}
