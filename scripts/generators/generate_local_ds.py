import os

ds_dir = "frontend/lib/datasources/local"
os.makedirs(ds_dir, exist_ok=True)

files = {
    "settings_local_data_source.dart": """import '../../models/settings_model.dart';

abstract class SettingsLocalDataSource {
  Future<Settings?> getSettings();
  Future<void> saveSettings(Settings settings);
  Future<void> clearSettings();
}
""",
    "theme_local_data_source.dart": """import '../../models/theme_settings_model.dart';

abstract class ThemeLocalDataSource {
  Future<ThemeSettings?> getThemeSettings();
  Future<void> saveThemeSettings(ThemeSettings themeSettings);
}
""",
    "offline_guide_local_data_source.dart": """import '../../models/offline_guide_model.dart';

abstract class OfflineGuideLocalDataSource {
  Future<List<OfflineGuide>> getOfflineGuides();
  Future<void> saveOfflineGuides(List<OfflineGuide> guides);
  Future<void> clearOfflineGuides();
}
""",
    "emergency_contact_local_data_source.dart": """import '../../models/emergency_contact_model.dart';

abstract class EmergencyContactLocalDataSource {
  Future<List<EmergencyContact>> getEmergencyContacts();
  Future<void> saveEmergencyContacts(List<EmergencyContact> contacts);
  Future<void> addEmergencyContact(EmergencyContact contact);
  Future<void> removeEmergencyContact(String id);
}
""",
    "cached_weather_local_data_source.dart": """import '../../models/weather_model.dart';

abstract class CachedWeatherLocalDataSource {
  Future<Weather?> getCachedWeather(String locationId);
  Future<void> saveCachedWeather(String locationId, Weather weather);
  Future<void> clearCachedWeather();
}
""",
    "cached_alert_local_data_source.dart": """import '../../models/alert_model.dart';

abstract class CachedAlertLocalDataSource {
  Future<List<Alert>> getCachedAlerts();
  Future<void> saveCachedAlerts(List<Alert> alerts);
  Future<void> clearCachedAlerts();
}
""",
    "profile_local_data_source.dart": """import '../../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<Profile?> getCachedProfile(String userId);
  Future<void> saveCachedProfile(Profile profile);
  Future<void> clearCachedProfile();
}
""",
    "recent_reports_local_data_source.dart": """import '../../models/disaster_report_model.dart';

abstract class RecentReportsLocalDataSource {
  Future<List<DisasterReport>> getRecentReports();
  Future<void> saveRecentReports(List<DisasterReport> reports);
  Future<void> addRecentReport(DisasterReport report);
  Future<void> clearRecentReports();
}
"""
}

for filename, content in files.items():
    with open(os.path.join(ds_dir, filename), "w") as f:
        f.write(content)
