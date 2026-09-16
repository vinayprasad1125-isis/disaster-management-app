// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearbyDeviceImpl _$$NearbyDeviceImplFromJson(
  Map<String, dynamic> json,
) => _$NearbyDeviceImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  status:
      $enumDecodeNullable(_$DeviceStatusEnumMap, json['status']) ??
      DeviceStatus.discovered,
  signalStrength:
      $enumDecodeNullable(_$SignalStrengthEnumMap, json['signalStrength']) ??
      SignalStrength.none,
  connectionType:
      $enumDecodeNullable(_$ConnectionTypeEnumMap, json['connectionType']) ??
      ConnectionType.unknown,
  distanceInMeters: (json['distanceInMeters'] as num?)?.toDouble(),
  avatarUrl: json['avatarUrl'] as String?,
);

Map<String, dynamic> _$$NearbyDeviceImplToJson(_$NearbyDeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$DeviceStatusEnumMap[instance.status]!,
      'signalStrength': _$SignalStrengthEnumMap[instance.signalStrength]!,
      'connectionType': _$ConnectionTypeEnumMap[instance.connectionType]!,
      'distanceInMeters': instance.distanceInMeters,
      'avatarUrl': instance.avatarUrl,
    };

const _$DeviceStatusEnumMap = {
  DeviceStatus.discovered: 'discovered',
  DeviceStatus.connecting: 'connecting',
  DeviceStatus.connected: 'connected',
  DeviceStatus.disconnected: 'disconnected',
  DeviceStatus.rejected: 'rejected',
  DeviceStatus.error: 'error',
};

const _$SignalStrengthEnumMap = {
  SignalStrength.excellent: 'excellent',
  SignalStrength.good: 'good',
  SignalStrength.fair: 'fair',
  SignalStrength.weak: 'weak',
  SignalStrength.none: 'none',
};

const _$ConnectionTypeEnumMap = {
  ConnectionType.bluetooth: 'bluetooth',
  ConnectionType.ble: 'ble',
  ConnectionType.wifiDirect: 'wifiDirect',
  ConnectionType.unknown: 'unknown',
};
