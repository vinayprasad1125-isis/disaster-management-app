import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/walkie_talkie_provider.dart';
import '../../providers/connection_provider.dart';
import '../../models/enums.dart';
import '../widgets/ptt_button.dart';

class WalkieTalkieScreen extends ConsumerWidget {
  const WalkieTalkieScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connState = ref.watch(connectionProvider);
    final pttState = ref.watch(walkieTalkieProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Offline Comms'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.call_end),
            color: theme.colorScheme.error,
            onPressed: () {
              ref.read(connectionProvider.notifier).disconnect();
              context.pop();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Header Info
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Icon(Icons.person, color: theme.colorScheme.onPrimaryContainer),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          connState.connectedDevice?.name ?? 'Unknown Device',
                          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Signal: Strong • Wi-Fi Direct',
                          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const Spacer(),
            
            // Status Text
            Text(
              pttState == WalkieTalkieStatus.transmitting
                  ? 'TRANSMITTING...'
                  : pttState == WalkieTalkieStatus.listening
                      ? 'LISTENING...'
                      : 'READY',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: pttState == WalkieTalkieStatus.transmitting 
                    ? theme.colorScheme.error 
                    : theme.colorScheme.primary,
              ),
            ),
            
            const SizedBox(height: 48),
            
            // PTT Button
            PttButton(
              isTransmitting: pttState == WalkieTalkieStatus.transmitting,
              onPressedDown: () {
                ref.read(walkieTalkieProvider.notifier).startTransmitting();
              },
              onPressedUp: () {
                ref.read(walkieTalkieProvider.notifier).stopTransmitting();
              },
            ),
            
            const Spacer(),
            
            // Quick Actions
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(context, Icons.sos, 'Emergency', theme.colorScheme.error),
                  _buildActionButton(context, Icons.location_on, 'Share Loc', theme.colorScheme.secondary),
                  _buildActionButton(context, Icons.message, 'Quick Chat', theme.colorScheme.primary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label, Color color) {
    return Column(
      children: [
        IconButton.filledTonal(
          onPressed: () {
            // TODO: implement specific actions
          },
          icon: Icon(icon, color: color),
          style: IconButton.styleFrom(
            backgroundColor: color.withOpacity(0.1),
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
