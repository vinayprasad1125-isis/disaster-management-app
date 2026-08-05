// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'communication_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunicationSessionImpl _$$CommunicationSessionImplFromJson(
  Map<String, dynamic> json,
) => _$CommunicationSessionImpl(
  sessionId: json['sessionId'] as String,
  peerDevice: NearbyDevice.fromJson(json['peerDevice'] as Map<String, dynamic>),
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: json['endTime'] == null
      ? null
      : DateTime.parse(json['endTime'] as String),
  callState: $enumDecode(_$CallStateEnumMap, json['callState']),
);

Map<String, dynamic> _$$CommunicationSessionImplToJson(
  _$CommunicationSessionImpl instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'peerDevice': instance.peerDevice,
  'startTime': instance.startTime.toIso8601String(),
  'endTime': instance.endTime?.toIso8601String(),
  'callState': _$CallStateEnumMap[instance.callState]!,
};

const _$CallStateEnumMap = {
  CallState.idle: 'idle',
  CallState.incoming: 'incoming',
  CallState.outgoing: 'outgoing',
  CallState.active: 'active',
  CallState.ended: 'ended',
};
