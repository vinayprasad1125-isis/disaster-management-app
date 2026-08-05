// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherForecastImpl _$$WeatherForecastImplFromJson(
  Map<String, dynamic> json,
) => _$WeatherForecastImpl(
  date: DateTime.parse(json['date'] as String),
  temperature: (json['temperature'] as num).toDouble(),
  condition: json['condition'] as String,
);

Map<String, dynamic> _$$WeatherForecastImplToJson(
  _$WeatherForecastImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'temperature': instance.temperature,
  'condition': instance.condition,
};
