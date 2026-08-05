// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disaster_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisasterReportImpl _$$DisasterReportImplFromJson(Map<String, dynamic> json) =>
    _$DisasterReportImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      severity: json['severity'] as String,
      locationId: json['locationId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$DisasterReportImplToJson(
  _$DisasterReportImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'description': instance.description,
  'severity': instance.severity,
  'locationId': instance.locationId,
  'timestamp': instance.timestamp.toIso8601String(),
};
