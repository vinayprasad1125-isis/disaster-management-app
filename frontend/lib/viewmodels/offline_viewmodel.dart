import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/offline_guide_model.dart';
import '../core/providers/repository_providers.dart';

class OfflineViewModel extends AsyncNotifier<List<OfflineGuide>> {
  @override
  FutureOr<List<OfflineGuide>> build() async {
    return ref.read(offlineRepositoryProvider).getOfflineGuides();
  }

  Future<void> downloadGuides(List<OfflineGuide> guides) async {
    state = const AsyncValue.loading();
    await ref.read(offlineRepositoryProvider).saveOfflineGuides(guides);
    state = await AsyncValue.guard(
      () => ref.read(offlineRepositoryProvider).getOfflineGuides(),
    );
  }
}

final offlineViewModelProvider =
    AsyncNotifierProvider<OfflineViewModel, List<OfflineGuide>>(() {
      return OfflineViewModel();
    });
