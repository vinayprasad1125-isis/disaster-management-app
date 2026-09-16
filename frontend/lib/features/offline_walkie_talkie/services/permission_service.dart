import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';

class PermissionService {
  Future<bool> requestWalkieTalkiePermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.location,
      // Android 12+ Bluetooth
      Permission.bluetoothScan,
      Permission.bluetoothAdvertise,
      Permission.bluetoothConnect,
      // Android 13+ Nearby Wi-Fi
      Permission.nearbyWifiDevices,
    ].request();

    bool allGranted = true;

    for (var entry in statuses.entries) {
      if (!entry.value.isGranted) {
        debugPrint('${entry.key} was denied or permanently denied.');
        // Some devices don't have all permissions (e.g. Android < 12 won't grant bluetoothScan)
        // So we gracefully check if it's permanently denied or just not applicable.
        if (entry.value.isPermanentlyDenied) {
          // You could open app settings here or return false
          allGranted = false;
        } else if (entry.value.isDenied && _isRequiredPermission(entry.key)) {
           allGranted = false;
        }
      }
    }

    // Additional generic bluetooth check just in case
    if (await Permission.bluetooth.isDenied) {
      var status = await Permission.bluetooth.request();
      if (!status.isGranted) allGranted = false;
    }

    return allGranted;
  }

  bool _isRequiredPermission(Permission permission) {
    if (permission == Permission.microphone || permission == Permission.location) {
      return true;
    }
    return false; // For older Androids, BT/Wifi specific permissions might return denied safely.
  }

  Future<void> openSettings() async {
    await openAppSettings();
  }
}
