import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../core/providers/repository_providers.dart';

class AuthViewModel extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() async {
    final repo = ref.read(authRepositoryProvider);
    final isLoggedIn = await repo.isLoggedIn();
    if (isLoggedIn) {
      // For mock purposes, just return a dummy if logged in, or null.
      return null;
    }
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).login(email, password),
    );
  }

  Future<void> loginAsGuest() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).loginAsGuest(),
    );
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncValue.data(null);
  }
}

final authViewModelProvider = AsyncNotifierProvider<AuthViewModel, User?>(() {
  return AuthViewModel();
});
