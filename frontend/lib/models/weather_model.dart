import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required double temperature,
    required String condition,
    required double humidity,
    required double windSpeed,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
