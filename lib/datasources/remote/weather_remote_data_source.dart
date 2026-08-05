import '../../models/weather_model.dart';
import '../../models/weather_forecast_model.dart';

abstract class WeatherRemoteDataSource {
  Future<Weather> getCurrentWeather(double lat, double lng);
  Future<List<WeatherForecast>> getForecast(double lat, double lng);
}
