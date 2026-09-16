import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
                Text('$temp°C', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          );
        },
      ),
    );
  }
}
