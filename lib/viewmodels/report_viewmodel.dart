import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/disaster_report_model.dart';
import '../core/providers/repository_providers.dart';

class ReportViewModel extends AsyncNotifier<List<DisasterReport>> {
  @override
  FutureOr<List<DisasterReport>> build() async {
    return ref.read(reportRepositoryProvider).getRecentReports(0.0, 0.0);
  }

  Future<void> fetchReports(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(reportRepositoryProvider).getRecentReports(lat, lng),
    );
  }

  Future<void> submitReport(DisasterReport report) async {
    state = const AsyncValue.loading();
    await ref.read(reportRepositoryProvider).submitReport(report);
    // After submitting, refresh the list
    state = await AsyncValue.guard(
      () => ref.read(reportRepositoryProvider).getRecentReports(0.0, 0.0),
    );
  }
}

final reportViewModelProvider =
    AsyncNotifierProvider<ReportViewModel, List<DisasterReport>>(() {
      return ReportViewModel();
    });
