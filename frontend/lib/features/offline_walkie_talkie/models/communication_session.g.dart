// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'communication_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunicationSessionImpl _$$CommunicationSessionImplFromJson(
  Map<String, dynamic> json,
) => _$CommunicationSessionImpl(
  sessionId: json['sessionId'] as String,
  remoteDevice: NearbyDevice.fromJson(
    json['remoteDevice'] as Map<String, dynamic>,
  ),
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: json['endTime'] == null
      ? null
      : DateTime.parse(json['endTime'] as String),
  quality:
      $enumDecodeNullable(_$ConnectionQualityEnumMap, json['quality']) ??
      ConnectionQuality.high,
  errorLogs:
      (json['errorLogs'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$CommunicationSessionImplToJson(
  _$CommunicationSessionImpl instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'remoteDevice': instance.remoteDevice,
  'startTime': instance.startTime.toIso8601String(),
  'endTime': instance.endTime?.toIso8601String(),
  'quality': _$ConnectionQualityEnumMap[instance.quality]!,
  'errorLogs': instance.errorLogs,
};

const _$ConnectionQualityEnumMap = {
  ConnectionQuality.high: 'high',
  ConnectionQuality.medium: 'medium',
  ConnectionQuality.low: 'low',
  ConnectionQuality.unstable: 'unstable',
};
