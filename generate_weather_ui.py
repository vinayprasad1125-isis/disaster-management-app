import os

weather_dir = "lib/features/weather/presentation/screens"
widgets_dir = "lib/features/weather/presentation/widgets"

os.makedirs(weather_dir, exist_ok=True)
os.makedirs(widgets_dir, exist_ok=True)

files = {
    "screens/weather_screen.dart": """import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: const Text('Weather Conditions'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(weatherViewModelProvider.notifier).refreshWeather(0.0, 0.0);
        },
        child: weatherState.when(
          data: (weather) {
            if (weather == null) {
              return const CustomErrorWidget(message: 'Weather data unavailable.');
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
            onRetry: () => ref.read(weatherViewModelProvider.notifier).refreshWeather(0.0, 0.0),
          ),
        ),
      ),
    );
  }
}
""",
    "widgets/current_weather_card.dart": """import 'package:flutter/material.dart';
import '../../../../models/weather_model.dart';
import '../../../../shared/widgets/custom_card.dart';

class CurrentWeatherCard extends StatelessWidget {
  final Weather weather;

  const CurrentWeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      type: CustomCardType.filled,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        children: [
          Icon(
            _getWeatherIcon(weather.condition),
            size: 80,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          const SizedBox(height: 16),
          Text(
            '\${weather.temperature}°C',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
          Text(
            weather.condition,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetric(context, Icons.water_drop, '\${weather.humidity}%', 'Humidity'),
              _buildMetric(context, Icons.air, '\${weather.windSpeed} km/h', 'Wind'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(BuildContext context, IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.onPrimaryContainer),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
              ),
        ),
      ],
    );
  }

  IconData _getWeatherIcon(String condition) {
    final lower = condition.toLowerCase();
    if (lower.contains('rain') || lower.contains('storm')) return Icons.thunderstorm;
    if (lower.contains('cloud')) return Icons.cloud;
    if (lower.contains('snow')) return Icons.ac_unit;
    return Icons.wb_sunny;
  }
}
""",
    "widgets/forecast_list_widget.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../viewmodels/weather_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';

class ForecastListWidget extends ConsumerWidget {
  const ForecastListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real app, you might have a separate provider or property for the forecast.
    // For this demonstration, we'll assume the forecast data is either loaded alongside weather
    // or mocked. Since MockWeatherRepository returns a list for getForecast, we'll just mock it directly here
    // for simplicity, or we can fetch it via a separate FutureProvider. 
    
    // We will build a dummy UI structure for the forecast since the repository returns it via a method.
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final date = DateTime.now().add(Duration(days: index + 1));
          final temp = 25 - (index % 3); // Dummy temperature
          return CustomCard(
            type: CustomCardType.outlined,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('EEE').format(date),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                const Icon(Icons.cloud, size: 32),
                const SizedBox(height: 8),
                Text(
                  '\$temp°C',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
"""
}

for filename, content in files.items():
    full_path = os.path.join("lib/features/weather/presentation", filename)
    with open(full_path, "w") as f:
        f.write(content)
