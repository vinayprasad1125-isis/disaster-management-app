import '../weather_repository.dart';
import '../../models/weather_model.dart';
import '../../models/weather_forecast_model.dart';

class MockWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> getCurrentWeather(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Weather(
      temperature: 28.5,
      condition: 'Heavy Rain',
      humidity: 85.0,
      windSpeed: 45.0,
    );
  }

  @override
  Future<List<WeatherForecast>> getForecast(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      WeatherForecast(
        date: DateTime.now().add(const Duration(days: 1)),
        temperature: 27.0,
        condition: 'Storm',
      ),
      WeatherForecast(
        date: DateTime.now().add(const Duration(days: 2)),
        temperature: 29.0,
        condition: 'Cloudy',
      ),
    ];
  }
}
