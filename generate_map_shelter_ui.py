import os

map_shelters_dir = "lib/features/map_shelters/presentation/screens"
os.makedirs(map_shelters_dir, exist_ok=True)

files = {
    "map_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/map_viewmodel.dart';
import '../../../../shared/widgets/custom_error_widget.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mapViewModelProvider.notifier).fetchMarkers(0.0, 0.0, 10.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(mapViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: [
          // Mock Map Background
          Container(
            color: const Color(0xFFE0E0E0),
            child: const Center(
              child: Text(
                'Map Placeholder',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          // Map Markers Overlay
          mapState.when(
            data: (markers) {
              if (markers.isEmpty) return const SizedBox.shrink();
              return Stack(
                children: markers.map((marker) {
                  // Simulate random positions on screen for mock markers
                  final left = (marker.latitude * 100) % MediaQuery.of(context).size.width;
                  final top = (marker.longitude * 100) % MediaQuery.of(context).size.height;
                  
                  return Positioned(
                    left: left.abs(),
                    top: top.abs(),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => Container(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  marker.title,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(marker.description),
                                const SizedBox(height: 16),
                                Text('Type: \${marker.type.toUpperCase()}'),
                              ],
                            ),
                          ),
                        );
                      },
                      child: _buildMarkerIcon(marker.type),
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: CustomErrorWidget(message: err.toString())),
          ),
        ],
      ),
    );
  }

  Widget _buildMarkerIcon(String type) {
    IconData icon;
    Color color;
    switch (type.toLowerCase()) {
      case 'danger':
        icon = Icons.warning;
        color = Colors.red;
        break;
      case 'shelter':
        icon = Icons.house;
        color = Colors.green;
        break;
      case 'resource':
        icon = Icons.local_hospital;
        color = Colors.blue;
        break;
      default:
        icon = Icons.location_on;
        color = Colors.orange;
    }
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 36),
      ],
    );
  }
}
""",
    "shelter_list_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
      appBar: AppBar(
        title: const Text('Nearby Shelters'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(shelterViewModelProvider.notifier).fetchNearbyShelters(0.0, 0.0);
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
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shelter.name,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Capacity: \${shelter.currentOccupancy} / \${shelter.capacity}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    shelter.address,
                                    style: Theme.of(context).textTheme.bodySmall,
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
            onRetry: () => ref.read(shelterViewModelProvider.notifier).fetchNearbyShelters(0.0, 0.0),
          ),
        ),
      ),
    );
  }
}
""",
    "shelter_detail_screen.dart": """import 'package:flutter/material.dart';
import '../../../../models/shelter_model.dart';
import '../../../../shared/widgets/custom_button.dart';

class ShelterDetailScreen extends StatelessWidget {
  final Shelter shelter;

  const ShelterDetailScreen({super.key, required this.shelter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shelter Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Icon(
                Icons.image_not_supported_outlined,
                size: 80,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shelter.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          shelter.address,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _buildInfoBadge(context, Icons.people, '\${shelter.currentOccupancy} / \${shelter.capacity}', 'Capacity'),
                      const SizedBox(width: 16),
                      _buildInfoBadge(context, Icons.phone, shelter.contactPhone ?? 'N/A', 'Contact'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Available Facilities',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: shelter.facilities.map((f) => Chip(label: Text(f))).toList(),
                  ),
                  const SizedBox(height: 48),
                  CustomButton(
                    text: 'Get Directions',
                    icon: const Icon(Icons.directions),
                    onPressed: () {
                      // Launch maps intent
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Opening maps...')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBadge(BuildContext context, IconData icon, String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.onSecondaryContainer),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
"""
}

for filename, content in files.items():
    full_path = os.path.join(map_shelters_dir, filename)
    with open(full_path, "w") as f:
        f.write(content)
