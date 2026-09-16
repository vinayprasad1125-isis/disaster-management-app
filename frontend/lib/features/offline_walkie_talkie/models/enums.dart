enum SignalStrength {
  excellent,
  good,
  fair,
  weak,
  none;

  String get displayName {
    switch (this) {
      case SignalStrength.excellent:
        return 'Excellent';
      case SignalStrength.good:
        return 'Good';
      case SignalStrength.fair:
        return 'Fair';
      case SignalStrength.weak:
        return 'Weak';
      case SignalStrength.none:
        return 'No Signal';
    }
  }
}

enum ConnectionQuality {
  high,
  medium,
  low,
  unstable,
}

enum DeviceStatus {
  discovered,
  connecting,
  connected,
  disconnected,
  rejected,
  error,
}

enum ConnectionType {
  bluetooth,
  ble,
  wifiDirect,
  unknown,
}

enum WalkieTalkieStatus {
  idle,
  listening,
  transmitting,
  error,
}
