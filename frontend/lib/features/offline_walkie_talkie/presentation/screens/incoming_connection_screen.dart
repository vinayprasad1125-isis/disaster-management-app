import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/connection_provider.dart';

class IncomingConnectionScreen extends ConsumerWidget {
  const IncomingConnectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connState = ref.watch(connectionProvider);
    final theme = Theme.of(context);

    // If connection gets accepted or rejected elsewhere, pop this screen
    ref.listen(connectionProvider, (previous, next) {
      if (next.incomingConnectionEndpointId == null && previous?.incomingConnectionEndpointId != null) {
        if (context.mounted) {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go('/offline_walkie_talkie');
          }
        }
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            CircleAvatar(
              radius: 60,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Icon(Icons.person, size: 64, color: theme.colorScheme.onPrimaryContainer),
            ),
            const SizedBox(height: 32),
            Text(
              'Incoming Walkie-Talkie',
              style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
            Text(
              connState.incomingConnectionName ?? 'Unknown User',
              style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Signal: Good'),
            
            const Spacer(),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    context, 
                    Icons.close, 
                    'Decline', 
                    theme.colorScheme.error,
                    () {
                      ref.read(connectionProvider.notifier).rejectConnection();
                      if (context.mounted) {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/offline_walkie_talkie');
                        }
                      }
                    }
                  ),
                  _buildActionButton(
                    context, 
                    Icons.check, 
                    'Accept', 
                    theme.colorScheme.primary,
                    () {
                      ref.read(connectionProvider.notifier).acceptConnection();
                      context.pushReplacement('/offline_walkie_talkie/chat');
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label, Color color, VoidCallback onTap) {
    return Column(
      children: [
        FloatingActionButton.large(
          onPressed: onTap,
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          child: Icon(icon, size: 36),
        ),
        const SizedBox(height: 12),
        Text(label, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
