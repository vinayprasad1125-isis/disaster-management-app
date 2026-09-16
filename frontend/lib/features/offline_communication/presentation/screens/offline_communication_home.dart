import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';

class OfflineCommunicationHome extends StatelessWidget {
  const OfflineCommunicationHome({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Offline Emergency')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.wifi_off_rounded, size: 100, color: colorScheme.primary),
            const SizedBox(height: 24),
            Text(
              'No Cellular or Internet?',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Use Bluetooth and Wi-Fi Direct to communicate with nearby users in the mesh network. Range is approximately 100 meters.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: () {
                context.push(AppRoutes.nearbyDevices);
              },
              icon: const Icon(Icons.radar_rounded),
              label: const Text('Scan for Nearby Devices'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Recent Connections',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text('Sarah Smith'),
              subtitle: const Text('Last seen 5 mins ago'),
              trailing: IconButton(
                icon: const Icon(Icons.chat_bubble_outline),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
