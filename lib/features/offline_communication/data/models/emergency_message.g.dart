// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmergencyMessageImpl _$$EmergencyMessageImplFromJson(
  Map<String, dynamic> json,
) => _$EmergencyMessageImpl(
  id: json['id'] as String,
  text: json['text'] as String,
  senderId: json['senderId'] as String,
  receiverId: json['receiverId'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  status: $enumDecode(_$MessageDeliveryStatusEnumMap, json['status']),
);

Map<String, dynamic> _$$EmergencyMessageImplToJson(
  _$EmergencyMessageImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'senderId': instance.senderId,
  'receiverId': instance.receiverId,
  'timestamp': instance.timestamp.toIso8601String(),
  'status': _$MessageDeliveryStatusEnumMap[instance.status]!,
};

const _$MessageDeliveryStatusEnumMap = {
  MessageDeliveryStatus.sending: 'sending',
  MessageDeliveryStatus.sent: 'sent',
  MessageDeliveryStatus.delivered: 'delivered',
  MessageDeliveryStatus.failed: 'failed',
};
