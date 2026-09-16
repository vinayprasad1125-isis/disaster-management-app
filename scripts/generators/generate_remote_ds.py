import os

ds_dir = "frontend/lib/datasources/remote"
os.makedirs(ds_dir, exist_ok=True)

files = {
    "auth_remote_data_source.dart": """import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String name, String email, String password);
  Future<User> loginAsGuest();
  Future<void> logout();
  Future<void> resetPassword(String email);
}
""",
    "weather_remote_data_source.dart": """import '../../models/weather_model.dart';
import '../../models/weather_forecast_model.dart';

abstract class WeatherRemoteDataSource {
  Future<Weather> getCurrentWeather(double lat, double lng);
  Future<List<WeatherForecast>> getForecast(double lat, double lng);
}
""",
    "alert_remote_data_source.dart": """import '../../models/alert_model.dart';

abstract class AlertRemoteDataSource {
  Future<List<Alert>> getAlerts(double lat, double lng);
}
""",
    "notification_remote_data_source.dart": """import '../../models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<Notification>> getNotifications(String userId);
  Future<void> markAsRead(String notificationId);
}
""",
    "map_remote_data_source.dart": """import '../../models/map_marker_model.dart';

abstract class MapRemoteDataSource {
  Future<List<MapMarker>> getMapMarkers(double lat, double lng, double radius);
}
""",
    "shelter_remote_data_source.dart": """import '../../models/shelter_model.dart';

abstract class ShelterRemoteDataSource {
  Future<List<Shelter>> getNearbyShelters(double lat, double lng);
  Future<Shelter> getShelterDetails(String id);
}
""",
    "volunteer_remote_data_source.dart": """import '../../models/volunteer_model.dart';

abstract class VolunteerRemoteDataSource {
  Future<List<Volunteer>> getNearbyVolunteers(double lat, double lng);
  Future<void> registerAsVolunteer(Volunteer volunteer);
}
""",
    "relief_center_remote_data_source.dart": """import '../../models/relief_center_model.dart';

abstract class ReliefCenterRemoteDataSource {
  Future<List<ReliefCenter>> getNearbyReliefCenters(double lat, double lng);
}
""",
    "report_remote_data_source.dart": """import '../../models/disaster_report_model.dart';

abstract class ReportRemoteDataSource {
  Future<List<DisasterReport>> getRecentReports(double lat, double lng);
  Future<void> submitReport(DisasterReport report);
}
""",
    "sos_remote_data_source.dart": """import '../../models/sos_model.dart';

abstract class SOSRemoteDataSource {
  Future<Sos> triggerSOS(Sos sosData);
  Future<void> cancelSOS(String sosId);
  Future<Sos> getSOSStatus(String sosId);
}
""",
    "profile_remote_data_source.dart": """import '../../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<Profile> getProfile(String userId);
  Future<void> updateProfile(Profile profile);
}
""",
    "ai_remote_data_source.dart": """import '../../models/ai_message_model.dart';

abstract class AIRemoteDataSource {
  Future<AiMessage> sendMessage(String message);
  Future<List<AiMessage>> getChatHistory(String sessionId);
}
""",
    "chat_remote_data_source.dart": """import '../../models/chat_message_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatMessage>> getMessages(String channelId);
  Future<void> sendMessage(String channelId, ChatMessage message);
}
""",
    "government_alert_remote_data_source.dart": """import '../../models/government_alert_model.dart';

abstract class GovernmentAlertRemoteDataSource {
  Future<List<GovernmentAlert>> getGovernmentAlerts();
}
""",
    "route_remote_data_source.dart": """import '../../models/route_model.dart';

abstract class RouteRemoteDataSource {
  Future<Route> getRoute(double startLat, double startLng, double endLat, double endLng);
}
"""
}

for filename, content in files.items():
    with open(os.path.join(ds_dir, filename), "w") as f:
        f.write(content)
