// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_packet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioPacketImpl _$$AudioPacketImplFromJson(Map<String, dynamic> json) =>
    _$AudioPacketImpl(
      packetId: json['packetId'] as String,
      sessionId: json['sessionId'] as String,
      senderId: json['senderId'] as String,
      sequenceNumber: (json['sequenceNumber'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      audioData: (json['audioData'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      isLastPacket: json['isLastPacket'] as bool,
    );

Map<String, dynamic> _$$AudioPacketImplToJson(_$AudioPacketImpl instance) =>
    <String, dynamic>{
      'packetId': instance.packetId,
      'sessionId': instance.sessionId,
      'senderId': instance.senderId,
      'sequenceNumber': instance.sequenceNumber,
      'timestamp': instance.timestamp.toIso8601String(),
      'audioData': instance.audioData,
      'isLastPacket': instance.isLastPacket,
    };
