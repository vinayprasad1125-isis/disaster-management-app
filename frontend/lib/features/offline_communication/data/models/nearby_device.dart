import 'package:freezed_annotation/freezed_annotation.dart';
import 'communication_enums.dart';

part 'nearby_device.freezed.dart';
part 'nearby_device.g.dart';

@freezed
class NearbyDevice with _$NearbyDevice {
  const factory NearbyDevice({
    required String id,
    required String name,
    required String avatarUrl,
    required double approximateDistanceMeters,
    required ConnectionType connectionType,
    required SignalStrength signalStrength,
    required ConnectionStatus status,
  }) = _NearbyDevice;

  factory NearbyDevice.fromJson(Map<String, dynamic> json) =>
      _$NearbyDeviceFromJson(json);
}
