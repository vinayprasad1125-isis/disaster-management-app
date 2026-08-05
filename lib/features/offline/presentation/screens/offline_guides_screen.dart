import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/offline_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';
import 'guide_detail_screen.dart';

class OfflineGuidesScreen extends ConsumerWidget {
  const OfflineGuidesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(offlineViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Offline Guides')),
      body: state.when(
        data: (guides) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: guides.length,
            itemBuilder: (context, index) {
              final g = guides[index];
              return CustomCard(
                type: CustomCardType.elevated,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GuideDetailScreen(guide: g),
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(g.title),
                  subtitle: Text(g.category),
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
