import '../../models/settings_model.dart';

abstract class SettingsLocalDataSource {
  Future<Settings?> getSettings();
  Future<void> saveSettings(Settings settings);
  Future<void> clearSettings();
}
