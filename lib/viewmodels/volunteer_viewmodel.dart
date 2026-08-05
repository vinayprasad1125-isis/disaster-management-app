import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/volunteer_model.dart';
import '../core/providers/repository_providers.dart';

class VolunteerViewModel extends AsyncNotifier<List<Volunteer>> {
  @override
  FutureOr<List<Volunteer>> build() async {
    return ref.read(volunteerRepositoryProvider).getNearbyVolunteers(0.0, 0.0);
  }

  Future<void> fetchVolunteers(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(volunteerRepositoryProvider).getNearbyVolunteers(lat, lng),
    );
  }

  Future<void> register(Volunteer v) async {
    state = const AsyncValue.loading();
    await ref.read(volunteerRepositoryProvider).registerAsVolunteer(v);
    state = await AsyncValue.guard(
      () => ref.read(volunteerRepositoryProvider).getNearbyVolunteers(0.0, 0.0),
    );
  }
}

final volunteerViewModelProvider =
    AsyncNotifierProvider<VolunteerViewModel, List<Volunteer>>(() {
      return VolunteerViewModel();
    });
