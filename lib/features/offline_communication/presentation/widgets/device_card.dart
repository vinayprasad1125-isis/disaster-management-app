import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/nearby_device.dart';
import '../../data/models/communication_enums.dart';
import '../providers/offline_communication_providers.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';

class DeviceCard extends ConsumerWidget {
  final NearbyDevice device;

  const DeviceCard({super.key, required this.device});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final connectionStatus = ref.watch(connectionStateProvider(device.id));
    final notifier = ref.read(connectionNotifierProvider);

    IconData typeIcon = device.connectionType == ConnectionType.bluetooth
        ? Icons.bluetooth
        : Icons.wifi_find;

    IconData signalIcon = Icons.signal_cellular_alt_1_bar;
    switch (device.signalStrength) {
      case SignalStrength.weak:
        signalIcon = Icons.signal_cellular_alt_1_bar;
        break;
      case SignalStrength.fair:
        signalIcon = Icons.signal_cellular_alt_2_bar;
        break;
      case SignalStrength.good:
        signalIcon = Icons.signal_cellular_alt;
        break;
      case SignalStrength.excellent:
        signalIcon = Icons.signal_wifi_4_bar;
        break;
    }

    Widget trailingWidget;
    switch (connectionStatus) {
      case ConnectionStatus.disconnected:
      case ConnectionStatus.failed:
        trailingWidget = ElevatedButton(
          onPressed: () => notifier.connect(device.id),
          child: const Text('Connect'),
        );
        break;
      case ConnectionStatus.connecting:
        trailingWidget = const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        );
        break;
      case ConnectionStatus.connected:
        trailingWidget = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.call, color: colorScheme.primary),
              onPressed: () {
                context.push(AppRoutes.offlineCall, extra: device.name);
              },
            ),
            IconButton(
              icon: Icon(Icons.message, color: colorScheme.secondary),
              onPressed: () {
                context.push(AppRoutes.offlineChat, extra: device.name);
              },
            ),
          ],
        );
        break;
    }

    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: colorScheme.primaryContainer,
              child: Icon(Icons.person, color: colorScheme.onPrimaryContainer),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        typeIcon,
                        size: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '~${device.approximateDistanceMeters.toInt()}m',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(signalIcon, size: 14, color: colorScheme.primary),
                    ],
                  ),
                ],
              ),
            ),
            trailingWidget,
          ],
        ),
      ),
    );
  }
}
