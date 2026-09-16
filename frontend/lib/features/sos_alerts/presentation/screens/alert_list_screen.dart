import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/alerts_provider.dart';
import '../../../../shared/widgets/custom_card.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../../../shared/widgets/custom_error_widget.dart';
import 'alert_detail_screen.dart';

class AlertListScreen extends ConsumerStatefulWidget {
  const AlertListScreen({super.key});

  @override
  ConsumerState<AlertListScreen> createState() => _AlertListScreenState();
}

class _AlertListScreenState extends ConsumerState<AlertListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(alertsViewModelProvider.notifier).fetchAlerts(0.0, 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final alertsState = ref.watch(alertsViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Disaster Alerts')),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref
              .read(alertsViewModelProvider.notifier)
              .fetchAlerts(0.0, 0.0);
        },
        child: alertsState.when(
          data: (alerts) {
            if (alerts.isEmpty) {
              return const EmptyStateWidget(
                title: 'No Active Alerts',
                message: 'Your area is currently safe.',
                icon: Icons.check_circle_outline,
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: alerts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final alert = alerts[index];
                final isSevere =
                    alert.severity.toLowerCase() == 'severe' ||
                    alert.severity.toLowerCase() == 'extreme';

                return CustomCard(
                  type: CustomCardType.outlined,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AlertDetailScreen(alert: alert),
                      ),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: isSevere
                          ? Theme.of(context).colorScheme.errorContainer
                          : Theme.of(context).colorScheme.tertiaryContainer,
                      child: Icon(
                        Icons.warning_amber_rounded,
                        color: isSevere
                            ? Theme.of(context).colorScheme.onErrorContainer
                            : Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                    title: Text(
                      alert.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DateFormat(
                        'MMM dd, yyyy - HH:mm',
                      ).format(alert.timestamp),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => CustomErrorWidget(
            message: err.toString(),
            onRetry: () => ref
                .read(alertsViewModelProvider.notifier)
                .fetchAlerts(0.0, 0.0),
          ),
        ),
      ),
    );
  }
}
