import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../relief_centers/presentation/providers/relief_centers_provider.dart';
import '../../../../shared/widgets/custom_card.dart';
import 'relief_center_detail_screen.dart';

class ReliefCenterListScreen extends ConsumerWidget {
  const ReliefCenterListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reliefCenterViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Relief Centers')),
      body: state.when(
        data: (centers) {
          if (centers.isEmpty) {
            return const Center(child: Text('No relief centers found.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: centers.length,
            itemBuilder: (context, index) {
              final center = centers[index];
              return CustomCard(
                type: CustomCardType.elevated,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ReliefCenterDetailScreen(center: center),
                  ),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.medical_services),
                  ),
                  title: Text(center.name),
                  subtitle: Text(center.resources.join(', ')),
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
