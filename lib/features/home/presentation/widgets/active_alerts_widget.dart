import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/alerts_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';
import '../../../../shared/widgets/empty_state_widget.dart';

class ActiveAlertsWidget extends ConsumerWidget {
  const ActiveAlertsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertsState = ref.watch(alertsViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Active Alerts',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        alertsState.when(
          data: (alerts) {
            if (alerts.isEmpty) {
              return const EmptyStateWidget(
                title: 'No Alerts',
                message: 'There are no active alerts in your area.',
                icon: Icons.check_circle_outline,
              );
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: alerts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final alert = alerts[index];
                return CustomCard(
                  type: CustomCardType.outlined,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.errorContainer,
                      child: Icon(
                        Icons.warning_amber_rounded,
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                    ),
                    title: Text(
                      alert.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(alert.description),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Text('Error: $err'),
        ),
      ],
    );
  }
}
