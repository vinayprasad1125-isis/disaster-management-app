import '../settings_repository.dart';
import '../../models/settings_model.dart';
import '../../models/theme_settings_model.dart';

class MockSettingsRepository implements SettingsRepository {
  @override
  Future<Settings> getSettings() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const Settings(
      language: 'English',
      notificationsEnabled: true,
      themeSettingsId: 'theme1',
    );
  }

  @override
  Future<void> saveSettings(Settings settings) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<ThemeSettings> getThemeSettings() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const ThemeSettings(isDarkMode: false, useSystemTheme: true);
  }

  @override
  Future<void> saveThemeSettings(ThemeSettings themeSettings) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
