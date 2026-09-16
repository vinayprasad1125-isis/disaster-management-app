import '../models/settings_model.dart';
import '../models/theme_settings_model.dart';

abstract class SettingsRepository {
  Future<Settings> getSettings();
  Future<void> saveSettings(Settings settings);
  Future<ThemeSettings> getThemeSettings();
  Future<void> saveThemeSettings(ThemeSettings themeSettings);
}
