import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_forecast_model.freezed.dart';
part 'weather_forecast_model.g.dart';

@freezed
class WeatherForecast with _$WeatherForecast {
  const factory WeatherForecast({
    required DateTime date,
    required double temperature,
    required String condition,
  }) = _WeatherForecast;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);
}
