import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/emergency_contact_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';

class EmergencyContactsScreen extends ConsumerWidget {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(emergencyContactViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Contacts')),
      body: state.when(
        data: (contacts) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final c = contacts[index];
              return CustomCard(
                type: CustomCardType.elevated,
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(c.name),
                  subtitle: Text(c.relationship),
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
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
