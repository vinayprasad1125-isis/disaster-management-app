// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlertImpl _$$AlertImplFromJson(Map<String, dynamic> json) => _$AlertImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  severity: json['severity'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$$AlertImplToJson(_$AlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'severity': instance.severity,
      'timestamp': instance.timestamp.toIso8601String(),
    };
