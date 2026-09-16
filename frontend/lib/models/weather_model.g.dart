// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      temperature: (json['temperature'] as num).toDouble(),
      condition: json['condition'] as String,
      humidity: (json['humidity'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'condition': instance.condition,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
    };
