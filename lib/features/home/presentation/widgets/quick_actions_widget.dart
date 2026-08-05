import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../offline_communication/presentation/widgets/sos_bottom_sheet.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ActionItem(
              icon: Icons.report_problem,
              label: 'Report',
              color: Theme.of(context).colorScheme.primary,
              onTap: () => context.push(AppRoutes.reports),
            ),
            _ActionItem(
              icon: Icons.wifi_off_rounded,
              label: 'Offline Comm.',
              color: Colors.orange.shade700,
              onTap: () => context.push(AppRoutes.offlineCommunication),
            ),
            _ActionItem(
              icon: Icons.sos,
              label: 'SOS',
              color: Theme.of(context).colorScheme.error,
              onTap: () => SOSBottomSheet.show(context),
            ),
            _ActionItem(
              icon: Icons.map,
              label: 'Map',
              color: Theme.of(context).colorScheme.secondary,
              onTap: () => context.push(AppRoutes.maps),
            ),
            _ActionItem(
              icon: Icons.house,
              label: 'Shelters',
              color: Theme.of(context).colorScheme.tertiary,
              onTap: () => context.push(AppRoutes.shelters),
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: color.withValues(alpha: 0.1),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
