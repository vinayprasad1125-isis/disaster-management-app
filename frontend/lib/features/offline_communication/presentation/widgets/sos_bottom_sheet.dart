import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';

class SOSBottomSheet extends StatelessWidget {
  const SOSBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const SOSBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Emergency Actions',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.radar)),
            title: const Text('Contact Nearby Devices (Offline)'),
            subtitle: const Text('Connect via Bluetooth/Wi-Fi Direct'),
            onTap: () {
              context.pop();
              context.push(AppRoutes.nearbyDevices);
            },
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.sos, color: Colors.white),
            ),
            title: const Text('Broadcast Global SOS'),
            subtitle: const Text(
              'Send alerts to authorities (Requires internet)',
            ),
            onTap: () {
              context.pop();
              context.push(AppRoutes.sos);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
