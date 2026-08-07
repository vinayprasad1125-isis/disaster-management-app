import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../providers/walkie_talkie_providers.dart';

class WalkieTalkieHomeScreen extends ConsumerWidget {
  const WalkieTalkieHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Walkie-Talkie'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              context.push('/offline_walkie_talkie/history');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Illustration
            Center(
              child: Icon(
                Icons.radio,
                size: 120,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 32),
            
            Text(
              'No Internet? No Problem.',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Communicate instantly with nearby devices using Wi-Fi Direct and Bluetooth. Perfect for emergency situations.',
              style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),

            FilledButton.icon(
              onPressed: () async {
                final permissionService = ref.read(permissionServiceProvider);
                bool hasPerms = await permissionService.requestWalkieTalkiePermissions();
                
                if (hasPerms) {
                  if (context.mounted) {
                    context.push('/offline_walkie_talkie/search');
                  }
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Permissions required to use Walkie-Talkie')),
                    );
                  }
                }
              },
              icon: const Icon(Icons.search),
              label: const Text('Find Nearby Devices'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Recent Connections Section
            Text(
              'Recent Connections',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Placeholder for recent devices
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.secondaryContainer,
                child: const Icon(Icons.person),
              ),
              title: const Text('Responder Team Alpha'),
              subtitle: const Text('Last connected: 2 hours ago'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Reconnect flow
              },
            ),
          ],
        ),
      ),
    );
  }
}
