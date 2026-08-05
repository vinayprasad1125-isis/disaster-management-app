import 'package:flutter/material.dart';
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
              _buildMetric(
                context,
                Icons.water_drop,
                '\${weather.humidity}%',
                'Humidity',
              ),
              _buildMetric(
                context,
                Icons.air,
                '\${weather.windSpeed} km/h',
                'Wind',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
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
            color: Theme.of(
              context,
            ).colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  IconData _getWeatherIcon(String condition) {
    final lower = condition.toLowerCase();
    if (lower.contains('rain') || lower.contains('storm')) {
      return Icons.thunderstorm;
    }
    if (lower.contains('cloud')) return Icons.cloud;
    if (lower.contains('snow')) return Icons.ac_unit;
    return Icons.wb_sunny;
  }
}
