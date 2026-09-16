// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiMessageImpl _$$AiMessageImplFromJson(Map<String, dynamic> json) =>
    _$AiMessageImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      isUser: json['isUser'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$AiMessageImplToJson(_$AiMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'isUser': instance.isUser,
      'timestamp': instance.timestamp.toIso8601String(),
    };
