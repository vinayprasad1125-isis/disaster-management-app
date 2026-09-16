import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/sos_model.dart';
import '../core/providers/repository_providers.dart';

class SOSViewModel extends AsyncNotifier<Sos?> {
  @override
  FutureOr<Sos?> build() async {
    return null;
  }

  Future<void> triggerSOS(Sos sosData) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(sosRepositoryProvider).triggerSOS(sosData),
    );
  }

  Future<void> cancelSOS(String sosId) async {
    state = const AsyncValue.loading();
    await ref.read(sosRepositoryProvider).cancelSOS(sosId);
    state = const AsyncValue.data(null);
  }
}

final sosViewModelProvider = AsyncNotifierProvider<SOSViewModel, Sos?>(() {
  return SOSViewModel();
});
