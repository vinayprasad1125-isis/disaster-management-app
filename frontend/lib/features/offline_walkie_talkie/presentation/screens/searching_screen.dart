import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/nearby_provider.dart';

class SearchingScreen extends ConsumerStatefulWidget {
  const SearchingScreen({super.key});

  @override
  ConsumerState<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends ConsumerState<SearchingScreen> {
  @override
  void initState() {
    super.initState();
    // Start discovery automatically when entering the screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(nearbyProvider.notifier).toggleDiscovery('My Device');
      ref.read(nearbyProvider.notifier).toggleAdvertising('My Device');
    });
  }

  @override
  void dispose() {
    // Stop discovery when leaving
    final notifier = ref.read(nearbyProvider.notifier);
    notifier.toggleDiscovery('My Device');
    notifier.toggleAdvertising('My Device');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nearbyState = ref.watch(nearbyProvider);
    final theme = Theme.of(context);

    // If we found devices, redirect to NearbyDevicesScreen or show them here
    // For simplicity, we can show them on this same screen or navigate
    if (nearbyState.discoveredDevices.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pushReplacement('/offline_walkie_talkie/devices');
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Searching...'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for radar animation
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
            const SizedBox(height: 48),
            Text(
              'Looking for nearby users...',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Make sure Bluetooth and Wi-Fi are enabled.',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
