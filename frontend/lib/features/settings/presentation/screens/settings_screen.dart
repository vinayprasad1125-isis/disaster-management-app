import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: state.when(
        data: (settings) {
          if (settings == null) {
            return const Center(child: Text('Settings error'));
          }
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Notifications'),
                value: settings.notificationsEnabled,
                onChanged: (value) {},
              ),
              ListTile(
                title: const Text('Language'),
                trailing: Text(settings.language),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
    );
  }
}
