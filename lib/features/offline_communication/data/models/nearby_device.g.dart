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
  avatarUrl: json['avatarUrl'] as String,
  approximateDistanceMeters: (json['approximateDistanceMeters'] as num)
      .toDouble(),
  connectionType: $enumDecode(_$ConnectionTypeEnumMap, json['connectionType']),
  signalStrength: $enumDecode(_$SignalStrengthEnumMap, json['signalStrength']),
  status: $enumDecode(_$ConnectionStatusEnumMap, json['status']),
);

Map<String, dynamic> _$$NearbyDeviceImplToJson(_$NearbyDeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'approximateDistanceMeters': instance.approximateDistanceMeters,
      'connectionType': _$ConnectionTypeEnumMap[instance.connectionType]!,
      'signalStrength': _$SignalStrengthEnumMap[instance.signalStrength]!,
      'status': _$ConnectionStatusEnumMap[instance.status]!,
    };

const _$ConnectionTypeEnumMap = {
  ConnectionType.bluetooth: 'bluetooth',
  ConnectionType.wifiDirect: 'wifiDirect',
};

const _$SignalStrengthEnumMap = {
  SignalStrength.weak: 'weak',
  SignalStrength.fair: 'fair',
  SignalStrength.good: 'good',
  SignalStrength.excellent: 'excellent',
};

const _$ConnectionStatusEnumMap = {
  ConnectionStatus.disconnected: 'disconnected',
  ConnectionStatus.connecting: 'connecting',
  ConnectionStatus.connected: 'connected',
  ConnectionStatus.failed: 'failed',
};
