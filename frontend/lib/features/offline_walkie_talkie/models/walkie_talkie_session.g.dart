// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walkie_talkie_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalkieTalkieSessionImpl _$$WalkieTalkieSessionImplFromJson(
  Map<String, dynamic> json,
) => _$WalkieTalkieSessionImpl(
  communicationSession: CommunicationSession.fromJson(
    json['communicationSession'] as Map<String, dynamic>,
  ),
  status:
      $enumDecodeNullable(_$WalkieTalkieStatusEnumMap, json['status']) ??
      WalkieTalkieStatus.idle,
  isSpeakerOn: json['isSpeakerOn'] as bool? ?? false,
  isMuted: json['isMuted'] as bool? ?? false,
  lastTransmissionDuration: json['lastTransmissionDuration'] == null
      ? null
      : Duration(
          microseconds: (json['lastTransmissionDuration'] as num).toInt(),
        ),
);

Map<String, dynamic> _$$WalkieTalkieSessionImplToJson(
  _$WalkieTalkieSessionImpl instance,
) => <String, dynamic>{
  'communicationSession': instance.communicationSession,
  'status': _$WalkieTalkieStatusEnumMap[instance.status]!,
  'isSpeakerOn': instance.isSpeakerOn,
  'isMuted': instance.isMuted,
  'lastTransmissionDuration': instance.lastTransmissionDuration?.inMicroseconds,
};

const _$WalkieTalkieStatusEnumMap = {
  WalkieTalkieStatus.idle: 'idle',
  WalkieTalkieStatus.listening: 'listening',
  WalkieTalkieStatus.transmitting: 'transmitting',
  WalkieTalkieStatus.error: 'error',
};
