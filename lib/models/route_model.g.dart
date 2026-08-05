// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteImpl _$$RouteImplFromJson(Map<String, dynamic> json) => _$RouteImpl(
  distance: json['distance'] as String,
  duration: json['duration'] as String,
  steps: (json['steps'] as List<dynamic>)
      .map((e) => RouteStep.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$RouteImplToJson(_$RouteImpl instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'steps': instance.steps,
    };
