import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/settings_models.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/repositories/settings_repository.dart';

final settingsFeatureRepositoryProvider = Provider<SettingsRepository>(
  (ref) => ApiSettingsRepository(),
);

class SettingsProvider extends AsyncNotifier<Settings?> {
  @override
  FutureOr<Settings?> build() async {
    return ref.read(settingsFeatureRepositoryProvider).getSettings();
  }

  Future<void> updateSettings(Settings settings) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(settingsFeatureRepositoryProvider)
          .saveSettings(settings);
      return settings;
    });
  }
}

final settingsProvider =
    AsyncNotifierProvider<SettingsProvider, Settings?>(SettingsProvider.new);
