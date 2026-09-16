// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteStepImpl _$$RouteStepImplFromJson(Map<String, dynamic> json) =>
    _$RouteStepImpl(
      instruction: json['instruction'] as String,
      distance: json['distance'] as String,
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$$RouteStepImplToJson(_$RouteStepImpl instance) =>
    <String, dynamic>{
      'instruction': instance.instruction,
      'distance': instance.distance,
      'duration': instance.duration,
    };
