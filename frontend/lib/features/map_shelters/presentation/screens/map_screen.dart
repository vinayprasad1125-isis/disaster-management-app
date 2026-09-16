import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';
import '../providers/map_provider.dart';
import '../../../../shared/widgets/custom_error_widget.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final MapController _mapController = MapController();

  // Default center: Chennai, India
  static const LatLng _defaultCenter = LatLng(13.0827, 80.2707);

  LatLng? _userLocation;
  bool _isLocating = false;
  String? _locationError;
  bool _canOpenLocationSettings = false;
  CacheStore? _cacheStore;

  @override
  void initState() {
    super.initState();
    _initCacheStore();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mapViewModelProvider.notifier).fetchMarkers(
            _defaultCenter.latitude,
            _defaultCenter.longitude,
            10.0,
          );
    });
  }

  Future<void> _initCacheStore() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}/map_tiles_cache';
      if (mounted) {
        setState(() {
          _cacheStore = FileCacheStore(path);
        });
      }
    } catch (_) {
      // The network tile provider remains available when disk caching fails.
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  Future<void> _locateMe() async {
    setState(() {
      _isLocating = true;
      _locationError = null;
      _canOpenLocationSettings = false;
    });

    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        if (mounted) {
          setState(() {
            _locationError = 'Location services are disabled.';
            _canOpenLocationSettings = true;
          });
        }
        await Geolocator.openLocationSettings();
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        if (mounted) {
          setState(() {
            _locationError = 'Location permission was not granted.';
            _canOpenLocationSettings = permission ==
                LocationPermission.deniedForever;
          });
        }
        if (permission == LocationPermission.deniedForever) {
          await Geolocator.openAppSettings();
        }
        return;
      }

      Position? position;
      try {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 12),
        );
      } catch (_) {
        position = await Geolocator.getLastKnownPosition();
      }
      if (position == null) {
        throw Exception(
          'Unable to determine your location. Move outdoors and try again.',
        );
      }
      final location = LatLng(position.latitude, position.longitude);

      if (!mounted) return;
      setState(() => _userLocation = location);
      _mapController.move(location, 14);
      await ref.read(mapViewModelProvider.notifier).fetchMarkers(
            location.latitude,
            location.longitude,
            10.0,
          );
    } catch (error) {
      if (mounted) {
        setState(() => _locationError = error.toString().replaceFirst('Exception: ', ''));
      }
    } finally {
      if (mounted) setState(() => _isLocating = false);
    }
  }

  Color _colorForType(String type) {
    switch (type.toLowerCase()) {
      case 'danger':
        return Colors.red;
      case 'shelter':
        return Colors.green;
      case 'hospital':
        return Colors.blue;
      case 'resource':
        return Colors.orange;
      default:
        return Colors.purple;
    }
  }

  IconData _iconForType(String type) {
    switch (type.toLowerCase()) {
      case 'danger':
        return Icons.warning_rounded;
      case 'shelter':
        return Icons.house_rounded;
      case 'hospital':
        return Icons.local_hospital_rounded;
      case 'resource':
        return Icons.inventory_2_rounded;
      default:
        return Icons.location_on_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(mapViewModelProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter',
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // Map layer
          FlutterMap(
            mapController: _mapController,
            options: const MapOptions(
              initialCenter: _defaultCenter,
              initialZoom: 11,
              minZoom: 3,
              maxZoom: 18,
            ),
            children: [
              // OpenStreetMap Tile Layer (cached for offline use)
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.disaster_management_app',
                maxNativeZoom: 19,
                tileProvider: _cacheStore == null
                    ? NetworkTileProvider()
                    : CachedTileProvider(store: _cacheStore!),
              ),
              // Disaster Marker Layer
              mapState.when(
                data: (markers) => MarkerLayer(
                  markers: markers.map((m) {
                    final color = _colorForType(m.type);
                    final icon = _iconForType(m.type);
                    return Marker(
                      point: LatLng(m.lat, m.lng),
                      width: 50,
                      height: 50,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(m.title),
                              content: Text('Type: ${m.type}'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: color.withValues(alpha: 0.5),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(icon, color: Colors.white, size: 24),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                loading: () => const MarkerLayer(markers: []),
                error: (_, __) => const MarkerLayer(markers: []),
              ),
              // User location marker layer
              if (_userLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _userLocation!,
                      width: 60,
                      height: 60,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.8, end: 1.0),
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        builder: (context, scale, child) =>
                            Transform.scale(scale: scale, child: child),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blue.withValues(alpha: 0.5),
                                  width: 1,
                                ),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withValues(alpha: 0.6),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),

          // Loading overlay
          if (mapState.isLoading)
            const Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: 8),
                        Text('Loading map data...'),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          // Location error snackbar
          if (_locationError != null)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red.shade800,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(Icons.location_off, color: Colors.white,
                          size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(_locationError!,
                            style: const TextStyle(color: Colors.white,
                                fontSize: 13)),
                      ),
                      if (_canOpenLocationSettings)
                        TextButton(
                          onPressed: () => Geolocator.openAppSettings(),
                          child: const Text(
                            'Settings',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      GestureDetector(
                        onTap: () => setState(() => _locationError = null),
                        child: const Icon(Icons.close, color: Colors.white,
                            size: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Error overlay
          if (mapState.hasError)
            Positioned(
              bottom: 100,
              left: 16,
              right: 16,
              child: CustomErrorWidget(
                message: mapState.error.toString(),
              ),
            ),

          // Legend
          Positioned(
            bottom: 16,
            right: 80,
            child: Card(
              color: theme.colorScheme.surface.withValues(alpha: 0.92),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Legend',
                        style: theme.textTheme.labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    _LegendItem(color: Colors.red, label: 'Danger Zone'),
                    _LegendItem(color: Colors.green, label: 'Shelter'),
                    _LegendItem(color: Colors.blue, label: 'Hospital'),
                    _LegendItem(color: Colors.orange, label: 'Resources'),
                    _LegendItem(color: Colors.blue, label: 'You', isDot: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Locate Me button
          FloatingActionButton(
            heroTag: 'locate_me',
            onPressed: _isLocating ? null : _locateMe,
            backgroundColor: theme.colorScheme.primaryContainer,
            tooltip: 'Locate Me',
            child: _isLocating
                ? SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  )
                : Icon(
                    _userLocation != null
                        ? Icons.my_location
                        : Icons.location_searching,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
          ),
          const SizedBox(height: 8),
          FloatingActionButton.small(
            heroTag: 'zoom_in',
            onPressed: () {
              _mapController.move(
                _mapController.camera.center,
                _mapController.camera.zoom + 1,
              );
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton.small(
            heroTag: 'zoom_out',
            onPressed: () {
              _mapController.move(
                _mapController.camera.center,
                _mapController.camera.zoom - 1,
              );
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final bool isDot;

  const _LegendItem(
      {required this.color, required this.label, this.isDot = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: isDot
                ? BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  )
                : BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
