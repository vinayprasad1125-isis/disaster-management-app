// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'government_alert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GovernmentAlertImpl _$$GovernmentAlertImplFromJson(
  Map<String, dynamic> json,
) => _$GovernmentAlertImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  source: json['source'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$$GovernmentAlertImplToJson(
  _$GovernmentAlertImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'source': instance.source,
  'timestamp': instance.timestamp.toIso8601String(),
};
