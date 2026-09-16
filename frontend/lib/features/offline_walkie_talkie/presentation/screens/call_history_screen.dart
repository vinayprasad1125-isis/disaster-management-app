import 'package:flutter/material.dart';

class CallHistoryScreen extends StatelessWidget {
  const CallHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // In a real implementation we would watch callHistoryProvider
    // For now we use a mockup view.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call History'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text('Responder ${index + 1}'),
            subtitle: Text('Duration: 00:0${index + 2}:45 • Offline'),
            trailing: Text(
              '${index + 1} hours ago',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          );
        },
      ),
    );
  }
}
