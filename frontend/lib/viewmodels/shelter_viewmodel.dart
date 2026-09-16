import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/shelter_model.dart';
import '../core/providers/repository_providers.dart';

class ShelterViewModel extends AsyncNotifier<List<Shelter>> {
  @override
  FutureOr<List<Shelter>> build() async {
    return ref.read(shelterRepositoryProvider).getNearbyShelters(0.0, 0.0);
  }

  Future<void> fetchNearbyShelters(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(shelterRepositoryProvider).getNearbyShelters(lat, lng),
    );
  }
}

final shelterViewModelProvider =
    AsyncNotifierProvider<ShelterViewModel, List<Shelter>>(() {
      return ShelterViewModel();
    });
