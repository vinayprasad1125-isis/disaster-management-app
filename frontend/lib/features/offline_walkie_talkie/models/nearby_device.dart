import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'nearby_device.freezed.dart';
part 'nearby_device.g.dart';

@freezed
class NearbyDevice with _$NearbyDevice {
  const factory NearbyDevice({
    required String id, // The endpointId from Nearby Connections
    required String name,
    @Default(DeviceStatus.discovered) DeviceStatus status,
    @Default(SignalStrength.none) SignalStrength signalStrength,
    @Default(ConnectionType.unknown) ConnectionType connectionType,
    double? distanceInMeters, // Estimated distance
    String? avatarUrl,
  }) = _NearbyDevice;

  factory NearbyDevice.fromJson(Map<String, dynamic> json) =>
      _$NearbyDeviceFromJson(json);
}
