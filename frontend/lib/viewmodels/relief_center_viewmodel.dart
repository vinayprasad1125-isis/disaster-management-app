import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/relief_center_model.dart';
import '../core/providers/repository_providers.dart';

class ReliefCenterViewModel extends AsyncNotifier<List<ReliefCenter>> {
  @override
  FutureOr<List<ReliefCenter>> build() async {
    return ref
        .read(reliefCenterRepositoryProvider)
        .getNearbyReliefCenters(0.0, 0.0);
  }

  Future<void> fetchReliefCenters(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref
          .read(reliefCenterRepositoryProvider)
          .getNearbyReliefCenters(lat, lng),
    );
  }
}

final reliefCenterViewModelProvider =
    AsyncNotifierProvider<ReliefCenterViewModel, List<ReliefCenter>>(() {
      return ReliefCenterViewModel();
    });
