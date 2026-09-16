// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SosImpl _$$SosImplFromJson(Map<String, dynamic> json) => _$SosImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  locationId: json['locationId'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  status: json['status'] as String,
);

Map<String, dynamic> _$$SosImplToJson(_$SosImpl instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'locationId': instance.locationId,
  'timestamp': instance.timestamp.toIso8601String(),
  'status': instance.status,
};
