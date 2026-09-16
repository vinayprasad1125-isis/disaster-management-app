import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_weather_provider.dart';
import '../../../../shared/widgets/custom_card.dart';

class WeatherSummaryWidget extends ConsumerWidget {
  const WeatherSummaryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherViewModelProvider);

    return CustomCard(
      type: CustomCardType.filled,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: weatherState.when(
        data: (weather) {
          if (weather == null) return const Text('No weather data available.');
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Weather',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${weather.temperature}°C - ${weather.condition}',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.cloud,
                size: 48,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Text('Error: $err'),
      ),
    );
  }
}
