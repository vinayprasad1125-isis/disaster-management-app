import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/profile_model.dart';
import '../core/providers/repository_providers.dart';

class ProfileViewModel extends AsyncNotifier<Profile?> {
  @override
  FutureOr<Profile?> build() async {
    return null;
  }

  Future<void> loadProfile(String userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(profileRepositoryProvider).getProfile(userId),
    );
  }

  Future<void> updateProfile(Profile profile) async {
    state = const AsyncValue.loading();
    await ref.read(profileRepositoryProvider).updateProfile(profile);
    state = AsyncValue.data(profile);
  }
}

final profileViewModelProvider =
    AsyncNotifierProvider<ProfileViewModel, Profile?>(() {
      return ProfileViewModel();
    });
