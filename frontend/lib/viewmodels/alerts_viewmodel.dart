import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/alert_model.dart';
import '../core/providers/repository_providers.dart';

class AlertsViewModel extends AsyncNotifier<List<Alert>> {
  @override
  FutureOr<List<Alert>> build() async {
    return ref.read(alertRepositoryProvider).getAlerts(0.0, 0.0);
  }

  Future<void> fetchAlerts(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(alertRepositoryProvider).getAlerts(lat, lng),
    );
  }
}

final alertsViewModelProvider =
    AsyncNotifierProvider<AlertsViewModel, List<Alert>>(() {
      return AlertsViewModel();
    });
