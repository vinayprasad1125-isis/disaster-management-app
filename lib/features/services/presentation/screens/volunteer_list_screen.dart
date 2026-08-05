import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/volunteer_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';
import 'volunteer_signup_screen.dart';

class VolunteerListScreen extends ConsumerWidget {
  const VolunteerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(volunteerViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Volunteers')),
      body: state.when(
        data: (vols) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: vols.length,
            itemBuilder: (context, index) {
              return CustomCard(
                type: CustomCardType.outlined,
                child: ListTile(
                  title: Text(vols[index].name),
                  subtitle: Text(vols[index].skills.join(', ')),
                  trailing: Text(vols[index].availability),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const VolunteerSignupScreen()),
        ),
        label: const Text('Volunteer Now'),
        icon: const Icon(Icons.handshake),
      ),
    );
  }
}
