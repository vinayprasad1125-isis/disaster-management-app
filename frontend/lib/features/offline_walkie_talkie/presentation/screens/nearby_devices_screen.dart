import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/nearby_provider.dart';
import '../../providers/connection_provider.dart';
import '../../models/enums.dart';

class NearbyDevicesScreen extends ConsumerWidget {
  const NearbyDevicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nearbyState = ref.watch(nearbyProvider);
    final connState = ref.watch(connectionProvider);
    final theme = Theme.of(context);

    ref.listen(connectionProvider, (previous, next) {
      if (next.status == DeviceStatus.connecting && next.incomingConnectionEndpointId != null) {
        if (previous?.incomingConnectionEndpointId == null) {
          context.push('/offline_walkie_talkie/incoming');
        }
      } else if (next.status == DeviceStatus.connected && previous?.status != DeviceStatus.connected) {
        context.pushReplacement('/offline_walkie_talkie/chat');
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Devices'),
        actions: [
           IconButton(
             icon: const Icon(Icons.refresh),
             onPressed: () {
               // Restart discovery logic
             },
           )
        ],
      ),
      body: nearbyState.discoveredDevices.isEmpty
          ? Center(
              child: Text(
                'No devices found.',
                style: theme.textTheme.bodyLarge,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: nearbyState.discoveredDevices.length,
              itemBuilder: (context, index) {
                final device = nearbyState.discoveredDevices[index];
                final isConnecting = connState.status == DeviceStatus.connecting && 
                                     connState.incomingConnectionEndpointId == device.id;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: Icon(Icons.person, color: theme.colorScheme.onPrimaryContainer),
                    ),
                    title: Text(device.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Distance: Unknown • ${device.connectionType.name}'),
                    trailing: isConnecting 
                        ? const CircularProgressIndicator()
                        : FilledButton(
                            onPressed: () {
                              ref.read(connectionProvider.notifier).requestConnection('My Device', device.id);
                            },
                            child: const Text('Connect'),
                          ),
                  ),
                );
              },
            ),
    );
  }
}
