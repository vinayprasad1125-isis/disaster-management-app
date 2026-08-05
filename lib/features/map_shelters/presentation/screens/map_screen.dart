import 'package:flutter/material.dart';
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
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
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
                  final left =
                      (marker.id.hashCode * 100) %
                      MediaQuery.of(context).size.width;
                  final top =
                      (marker.title.hashCode * 100) %
                      MediaQuery.of(context).size.height;

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
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                                Text('Type: ${marker.type.toUpperCase()}'),
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
            error: (err, _) =>
                Center(child: CustomErrorWidget(message: err.toString())),
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
      children: [Icon(icon, color: color, size: 36)],
    );
  }
}
