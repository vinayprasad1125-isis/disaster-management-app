import '../../models/theme_settings_model.dart';

abstract class ThemeLocalDataSource {
  Future<ThemeSettings?> getThemeSettings();
  Future<void> saveThemeSettings(ThemeSettings themeSettings);
}
