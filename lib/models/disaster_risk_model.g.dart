// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disaster_risk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisasterRiskImpl _$$DisasterRiskImplFromJson(Map<String, dynamic> json) =>
    _$DisasterRiskImpl(
      level: json['level'] as String,
      description: json['description'] as String,
      affectedAreas: (json['affectedAreas'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DisasterRiskImplToJson(_$DisasterRiskImpl instance) =>
    <String, dynamic>{
      'level': instance.level,
      'description': instance.description,
      'affectedAreas': instance.affectedAreas,
    };
