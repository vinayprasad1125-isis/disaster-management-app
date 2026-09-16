import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/custom_card.dart';
import '../providers/emergency_contacts_provider.dart';

class EmergencyContactsScreen extends ConsumerWidget {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(emergencyContactsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Contacts')),
      body: state.when(
        data: (contacts) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return CustomCard(
                type: CustomCardType.elevated,
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(contact.name),
                  subtitle: Text(contact.relationship),
                  trailing: IconButton(
                    icon: const Icon(Icons.phone),
                    onPressed: () {},
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
    );
  }
}
