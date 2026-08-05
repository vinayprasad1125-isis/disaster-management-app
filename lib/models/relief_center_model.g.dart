// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relief_center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReliefCenterImpl _$$ReliefCenterImplFromJson(Map<String, dynamic> json) =>
    _$ReliefCenterImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      resources: (json['resources'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      locationId: json['locationId'] as String,
    );

Map<String, dynamic> _$$ReliefCenterImplToJson(_$ReliefCenterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'resources': instance.resources,
      'locationId': instance.locationId,
    };
