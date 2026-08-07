// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmergencyMessageImpl _$$EmergencyMessageImplFromJson(
  Map<String, dynamic> json,
) => _$EmergencyMessageImpl(
  messageId: json['messageId'] as String,
  senderId: json['senderId'] as String,
  receiverId: json['receiverId'] as String,
  messageType: json['messageType'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$EmergencyMessageImplToJson(
  _$EmergencyMessageImpl instance,
) => <String, dynamic>{
  'messageId': instance.messageId,
  'senderId': instance.senderId,
  'receiverId': instance.receiverId,
  'messageType': instance.messageType,
  'timestamp': instance.timestamp.toIso8601String(),
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
