import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/walkie_talkie_local_datasource.dart';
import '../repositories/walkie_talkie_repository.dart';
import '../services/permission_service.dart';
import '../services/nearby_discovery_service.dart';
import '../services/nearby_connection_service.dart';
import '../services/audio_capture_service.dart';
import '../services/audio_playback_service.dart';
import '../services/audio_streaming_service.dart';
import '../services/location_service.dart';
import '../services/device_cache_service.dart';
import '../services/call_history_service.dart';

// --- Data & Repositories ---
final walkieTalkieLocalDatasourceProvider = Provider<WalkieTalkieLocalDatasource>((ref) {
  return WalkieTalkieLocalDatasource();
});

final walkieTalkieRepositoryProvider = Provider<WalkieTalkieRepository>((ref) {
  final datasource = ref.watch(walkieTalkieLocalDatasourceProvider);
  return WalkieTalkieRepository(datasource);
});

// --- Hardware & Core Services ---
final permissionServiceProvider = Provider<PermissionService>((ref) {
  return PermissionService();
});

final nearbyDiscoveryServiceProvider = Provider<NearbyDiscoveryService>((ref) {
  return NearbyDiscoveryService();
});

final nearbyConnectionServiceProvider = Provider<NearbyConnectionService>((ref) {
  return NearbyConnectionService();
});

final audioCaptureServiceProvider = Provider<AudioCaptureService>((ref) {
  return AudioCaptureService();
});

final audioPlaybackServiceProvider = Provider<AudioPlaybackService>((ref) {
  return AudioPlaybackService();
});

final audioStreamingServiceProvider = Provider<AudioStreamingService>((ref) {
  final capture = ref.watch(audioCaptureServiceProvider);
  final playback = ref.watch(audioPlaybackServiceProvider);
  final connection = ref.watch(nearbyConnectionServiceProvider);
  
  return AudioStreamingService(
    captureService: capture,
    playbackService: playback,
    connectionService: connection,
  );
});

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

// --- Domain Services ---
final deviceCacheServiceProvider = Provider<DeviceCacheService>((ref) {
  return DeviceCacheService(ref.watch(walkieTalkieRepositoryProvider));
});

final callHistoryServiceProvider = Provider<CallHistoryService>((ref) {
  return CallHistoryService(ref.watch(walkieTalkieRepositoryProvider));
});
