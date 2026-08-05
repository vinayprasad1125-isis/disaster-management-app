import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/shelter_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';
import '../../../../shared/widgets/custom_error_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import 'shelter_detail_screen.dart';

class ShelterListScreen extends ConsumerStatefulWidget {
  const ShelterListScreen({super.key});

  @override
  ConsumerState<ShelterListScreen> createState() => _ShelterListScreenState();
}

class _ShelterListScreenState extends ConsumerState<ShelterListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(shelterViewModelProvider.notifier).fetchNearbyShelters(0.0, 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final shelterState = ref.watch(shelterViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Nearby Shelters')),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref
              .read(shelterViewModelProvider.notifier)
              .fetchNearbyShelters(0.0, 0.0);
        },
        child: shelterState.when(
          data: (shelters) {
            if (shelters.isEmpty) {
              return const EmptyStateWidget(
                title: 'No Shelters Found',
                message: 'We could not find any shelters nearby.',
                icon: Icons.house_siding,
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: shelters.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final shelter = shelters[index];
                return CustomCard(
                  type: CustomCardType.elevated,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ShelterDetailScreen(shelter: shelter),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.house,
                          size: 40,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shelter.name,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Available Beds: ${shelter.availableBeds} / ${shelter.capacity}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    shelter.address,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => CustomErrorWidget(
            message: err.toString(),
            onRetry: () => ref
                .read(shelterViewModelProvider.notifier)
                .fetchNearbyShelters(0.0, 0.0),
          ),
        ),
      ),
    );
  }
}
