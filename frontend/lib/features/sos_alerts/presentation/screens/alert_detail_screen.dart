import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../models/alert_model.dart';
import '../../../../shared/widgets/custom_button.dart';

class AlertDetailScreen extends StatelessWidget {
  final Alert alert;

  const AlertDetailScreen({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    final isSevere =
        alert.severity.toLowerCase() == 'severe' ||
        alert.severity.toLowerCase() == 'extreme';
    final headerColor = isSevere
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.tertiary;
    final onHeaderColor = isSevere
        ? Theme.of(context).colorScheme.onError
        : Theme.of(context).colorScheme.onTertiary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Details'),
        backgroundColor: headerColor,
        foregroundColor: onHeaderColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: headerColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                alert.severity.toUpperCase(),
                style: TextStyle(
                  color: headerColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              alert.title,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Issued: ${DateFormat('MMM dd, yyyy - HH:mm').format(alert.timestamp)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Description',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              alert.description,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(height: 1.5),
            ),
            const SizedBox(height: 48),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Recommended Actions',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildActionItem(context, 'Follow local authorities instructions'),
            _buildActionItem(context, 'Prepare emergency kit'),
            _buildActionItem(context, 'Stay tuned to local news'),
            const SizedBox(height: 48),
            CustomButton(
              text: 'View Evacuation Map',
              icon: const Icon(Icons.map),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
