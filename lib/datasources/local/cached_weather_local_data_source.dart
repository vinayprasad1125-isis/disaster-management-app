import '../../models/weather_model.dart';

abstract class CachedWeatherLocalDataSource {
  Future<Weather?> getCachedWeather(String locationId);
  Future<void> saveCachedWeather(String locationId, Weather weather);
  Future<void> clearCachedWeather();
}
