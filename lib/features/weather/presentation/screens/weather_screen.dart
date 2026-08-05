import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/current_weather_card.dart';
import '../widgets/forecast_list_widget.dart';
import '../../../../viewmodels/weather_viewmodel.dart';
import '../../../../shared/widgets/custom_error_widget.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(weatherViewModelProvider.notifier).refreshWeather(0.0, 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Weather Conditions')),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref
              .read(weatherViewModelProvider.notifier)
              .refreshWeather(0.0, 0.0);
        },
        child: weatherState.when(
          data: (weather) {
            if (weather == null) {
              return const CustomErrorWidget(
                message: 'Weather data unavailable.',
              );
            }
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CurrentWeatherCard(weather: weather),
                  const SizedBox(height: 32),
                  Text(
                    '7-Day Forecast',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ForecastListWidget(),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => CustomErrorWidget(
            message: err.toString(),
            onRetry: () => ref
                .read(weatherViewModelProvider.notifier)
                .refreshWeather(0.0, 0.0),
          ),
        ),
      ),
    );
  }
}
