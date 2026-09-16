import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/settings_model.dart';
import '../core/providers/repository_providers.dart';

class SettingsViewModel extends AsyncNotifier<Settings?> {
  @override
  FutureOr<Settings?> build() async {
    return ref.read(settingsRepositoryProvider).getSettings();
  }

  Future<void> updateSettings(Settings settings) async {
    state = const AsyncValue.loading();
    await ref.read(settingsRepositoryProvider).saveSettings(settings);
    state = AsyncValue.data(settings);
  }
}

final settingsViewModelProvider =
    AsyncNotifierProvider<SettingsViewModel, Settings?>(() {
      return SettingsViewModel();
    });
