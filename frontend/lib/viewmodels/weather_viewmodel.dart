import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weather_model.dart';
import '../core/providers/repository_providers.dart';

class WeatherViewModel extends AsyncNotifier<Weather?> {
  @override
  FutureOr<Weather?> build() async {
    return ref.read(weatherRepositoryProvider).getCurrentWeather(0.0, 0.0);
  }

  Future<void> refreshWeather(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(weatherRepositoryProvider).getCurrentWeather(lat, lng),
    );
  }
}

final weatherViewModelProvider =
    AsyncNotifierProvider<WeatherViewModel, Weather?>(() {
      return WeatherViewModel();
    });
