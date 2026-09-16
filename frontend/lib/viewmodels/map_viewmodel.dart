import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/map_marker_model.dart';
import '../core/providers/repository_providers.dart';

class MapViewModel extends AsyncNotifier<List<MapMarker>> {
  @override
  FutureOr<List<MapMarker>> build() async {
    return ref.read(mapRepositoryProvider).getMapMarkers(0.0, 0.0, 10.0);
  }

  Future<void> fetchMarkers(double lat, double lng, double radius) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(mapRepositoryProvider).getMapMarkers(lat, lng, radius),
    );
  }
}

final mapViewModelProvider =
    AsyncNotifierProvider<MapViewModel, List<MapMarker>>(() {
      return MapViewModel();
    });
