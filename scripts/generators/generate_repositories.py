import os

repo_dir = "frontend/lib/repositories"
os.makedirs(repo_dir, exist_ok=True)

files = {
    "auth_repository.dart": """import '../models/user_model.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> register(String name, String email, String password);
  Future<User> loginAsGuest();
  Future<void> logout();
  Future<void> resetPassword(String email);
  Future<bool> isLoggedIn();
}
""",
    "weather_repository.dart": """import '../models/weather_model.dart';
import '../models/weather_forecast_model.dart';

abstract class WeatherRepository {
  Future<Weather> getCurrentWeather(double lat, double lng);
  Future<List<WeatherForecast>> getForecast(double lat, double lng);
}
""",
    "alert_repository.dart": """import '../models/alert_model.dart';

abstract class AlertRepository {
  Future<List<Alert>> getAlerts(double lat, double lng);
}
""",
    "notification_repository.dart": """import '../models/notification_model.dart';

abstract class NotificationRepository {
  Future<List<Notification>> getNotifications(String userId);
  Future<void> markAsRead(String notificationId);
}
""",
    "map_repository.dart": """import '../models/map_marker_model.dart';

abstract class MapRepository {
  Future<List<MapMarker>> getMapMarkers(double lat, double lng, double radius);
}
""",
    "shelter_repository.dart": """import '../models/shelter_model.dart';

abstract class ShelterRepository {
  Future<List<Shelter>> getNearbyShelters(double lat, double lng);
  Future<Shelter> getShelterDetails(String id);
}
""",
    "volunteer_repository.dart": """import '../models/volunteer_model.dart';

abstract class VolunteerRepository {
  Future<List<Volunteer>> getNearbyVolunteers(double lat, double lng);
  Future<void> registerAsVolunteer(Volunteer volunteer);
}
""",
    "relief_center_repository.dart": """import '../models/relief_center_model.dart';

abstract class ReliefCenterRepository {
  Future<List<ReliefCenter>> getNearbyReliefCenters(double lat, double lng);
}
""",
    "report_repository.dart": """import '../models/disaster_report_model.dart';

abstract class ReportRepository {
  Future<List<DisasterReport>> getRecentReports(double lat, double lng);
  Future<void> submitReport(DisasterReport report);
}
""",
    "sos_repository.dart": """import '../models/sos_model.dart';

abstract class SOSRepository {
  Future<Sos> triggerSOS(Sos sosData);
  Future<void> cancelSOS(String sosId);
  Future<Sos> getSOSStatus(String sosId);
}
""",
    "emergency_contact_repository.dart": """import '../models/emergency_contact_model.dart';

abstract class EmergencyContactRepository {
  Future<List<EmergencyContact>> getEmergencyContacts();
  Future<void> addEmergencyContact(EmergencyContact contact);
  Future<void> removeEmergencyContact(String id);
}
""",
    "profile_repository.dart": """import '../models/profile_model.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile(String userId);
  Future<void> updateProfile(Profile profile);
}
""",
    "settings_repository.dart": """import '../models/settings_model.dart';
import '../models/theme_settings_model.dart';

abstract class SettingsRepository {
  Future<Settings> getSettings();
  Future<void> saveSettings(Settings settings);
  Future<ThemeSettings> getThemeSettings();
  Future<void> saveThemeSettings(ThemeSettings themeSettings);
}
""",
    "offline_repository.dart": """import '../models/offline_guide_model.dart';

abstract class OfflineRepository {
  Future<List<OfflineGuide>> getOfflineGuides();
  Future<void> saveOfflineGuides(List<OfflineGuide> guides);
  Future<bool> isOfflineReady();
}
""",
    "ai_repository.dart": """import '../models/ai_message_model.dart';

abstract class AIRepository {
  Future<AiMessage> sendMessage(String message);
  Future<List<AiMessage>> getChatHistory(String sessionId);
}
""",
    "chat_repository.dart": """import '../models/chat_message_model.dart';

abstract class ChatRepository {
  Future<List<ChatMessage>> getMessages(String channelId);
  Future<void> sendMessage(String channelId, ChatMessage message);
}
""",
    "government_alert_repository.dart": """import '../models/government_alert_model.dart';

abstract class GovernmentAlertRepository {
  Future<List<GovernmentAlert>> getGovernmentAlerts();
}
""",
    "route_repository.dart": """import '../models/route_model.dart';

abstract class RouteRepository {
  Future<Route> getRoute(double startLat, double startLng, double endLat, double endLng);
}
"""
}

for filename, content in files.items():
    with open(os.path.join(repo_dir, filename), "w") as f:
        f.write(content)
