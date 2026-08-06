import '../weather_repository.dart';
import '../../models/weather_model.dart';
import '../../models/weather_forecast_model.dart';
import '../../core/api/api_client.dart';

class ApiWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> getCurrentWeather(double lat, double lng) async {
    try {
      final response = await apiClient.get('/weather/current?lat=$lat&lng=$lng');
      final data = response['data'];
      return Weather(
        temperature: data['temp']?.toDouble() ?? 0.0,
        condition: data['condition'] ?? 'Unknown',
        humidity: data['humidity']?.toDouble() ?? 0.0,
        windSpeed: data['windSpeed']?.toDouble() ?? 0.0,
      );
    } catch (e) {
      return const Weather(
        temperature: 28.5,
        condition: 'Heavy Rain',
        humidity: 85.0,
        windSpeed: 45.0,
      );
    }
  }

  @override
  Future<List<WeatherForecast>> getForecast(double lat, double lng) async {
    return [
      WeatherForecast(
        date: DateTime.now().add(const Duration(days: 1)),
        temperature: 27.0,
        condition: 'Storm',
      ),
    ];
  }
}
