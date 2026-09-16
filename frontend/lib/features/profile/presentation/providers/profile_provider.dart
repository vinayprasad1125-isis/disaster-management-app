import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/profile_model.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/repositories/profile_repository.dart';

final profileFeatureRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ApiProfileRepository(),
);

class ProfileProvider extends AsyncNotifier<Profile?> {
  @override
  FutureOr<Profile?> build() async {
    return null;
  }

  Future<void> loadProfile(String userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(profileFeatureRepositoryProvider).getProfile(userId),
    );
  }

  Future<void> updateProfile(Profile profile) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(profileFeatureRepositoryProvider)
          .updateProfile(profile);
      return profile;
    });
  }
}

final profileProvider =
    AsyncNotifierProvider<ProfileProvider, Profile?>(ProfileProvider.new);
