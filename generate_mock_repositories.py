import os

mock_dir = "lib/repositories/mock"
os.makedirs(mock_dir, exist_ok=True)

files = {
    "mock_auth_repository.dart": """import '../auth_repository.dart';
import '../../models/user_model.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return const User(id: '1', email: 'test@example.com', name: 'John Doe', token: 'mock-jwt-token');
  }

  @override
  Future<User> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return User(id: '2', email: email, name: name, token: 'mock-jwt-token-2');
  }

  @override
  Future<User> loginAsGuest() async {
    await Future.delayed(const Duration(seconds: 1));
    return const User(id: 'guest', email: 'guest@disasterapp.local', name: 'Guest User', token: 'mock-guest-token');
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> resetPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<bool> isLoggedIn() async {
    return false;
  }
}
""",
    "mock_weather_repository.dart": """import '../weather_repository.dart';
import '../../models/weather_model.dart';
import '../../models/weather_forecast_model.dart';

class MockWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> getCurrentWeather(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Weather(temperature: 28.5, condition: 'Heavy Rain', humidity: 85.0, windSpeed: 45.0);
  }

  @override
  Future<List<WeatherForecast>> getForecast(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      WeatherForecast(date: DateTime.now().add(const Duration(days: 1)), temperature: 27.0, condition: 'Storm'),
      WeatherForecast(date: DateTime.now().add(const Duration(days: 2)), temperature: 29.0, condition: 'Cloudy'),
    ];
  }
}
""",
    "mock_alert_repository.dart": """import '../alert_repository.dart';
import '../../models/alert_model.dart';

class MockAlertRepository implements AlertRepository {
  @override
  Future<List<Alert>> getAlerts(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Alert(id: 'a1', title: 'Flood Warning', description: 'Severe flooding expected in low-lying areas.', severity: 'High', timestamp: DateTime.now()),
      Alert(id: 'a2', title: 'Heavy Rainfall', description: 'Continuous rain expected for the next 48 hours.', severity: 'Medium', timestamp: DateTime.now().subtract(const Duration(hours: 2))),
    ];
  }
}
""",
    "mock_notification_repository.dart": """import '../notification_repository.dart';
import '../../models/notification_model.dart';

class MockNotificationRepository implements NotificationRepository {
  @override
  Future<List<Notification>> getNotifications(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Notification(id: 'n1', title: 'Safety Check', body: 'Please mark yourself as safe.', isRead: false, timestamp: DateTime.now()),
      Notification(id: 'n2', title: 'New Shelter Opened', body: 'A new relief shelter has opened near you.', isRead: true, timestamp: DateTime.now().subtract(const Duration(days: 1))),
    ];
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
""",
    "mock_map_repository.dart": """import '../map_repository.dart';
import '../../models/map_marker_model.dart';

class MockMapRepository implements MapRepository {
  @override
  Future<List<MapMarker>> getMapMarkers(double lat, double lng, double radius) async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      MapMarker(id: 'm1', title: 'City Hospital', type: 'Hospital', locationId: 'loc1'),
      MapMarker(id: 'm2', title: 'Central Relief Camp', type: 'Shelter', locationId: 'loc2'),
    ];
  }
}
""",
    "mock_shelter_repository.dart": """import '../shelter_repository.dart';
import '../../models/shelter_model.dart';

class MockShelterRepository implements ShelterRepository {
  @override
  Future<List<Shelter>> getNearbyShelters(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      Shelter(id: 's1', name: 'Community Hall Shelter', address: '123 Safe St.', capacity: 500, availableBeds: 150, locationId: 'loc1'),
      Shelter(id: 's2', name: 'School Relief Center', address: '456 Education Rd.', capacity: 200, availableBeds: 0, locationId: 'loc2'),
    ];
  }

  @override
  Future<Shelter> getShelterDetails(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Shelter(id: 's1', name: 'Community Hall Shelter', address: '123 Safe St.', capacity: 500, availableBeds: 150, locationId: 'loc1');
  }
}
""",
    "mock_volunteer_repository.dart": """import '../volunteer_repository.dart';
import '../../models/volunteer_model.dart';

class MockVolunteerRepository implements VolunteerRepository {
  @override
  Future<List<Volunteer>> getNearbyVolunteers(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      Volunteer(id: 'v1', name: 'Alice Smith', skills: ['Medical', 'Search & Rescue'], availability: 'Available', locationId: 'loc1'),
      Volunteer(id: 'v2', name: 'Bob Johnson', skills: ['Food Distribution', 'Driving'], availability: 'Busy', locationId: 'loc2'),
    ];
  }

  @override
  Future<void> registerAsVolunteer(Volunteer volunteer) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
""",
    "mock_relief_center_repository.dart": """import '../relief_center_repository.dart';
import '../../models/relief_center_model.dart';

class MockReliefCenterRepository implements ReliefCenterRepository {
  @override
  Future<List<ReliefCenter>> getNearbyReliefCenters(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      ReliefCenter(id: 'rc1', name: 'Downtown Relief', resources: ['Food', 'Water', 'Medical'], locationId: 'loc1'),
      ReliefCenter(id: 'rc2', name: 'Westside Camp', resources: ['Clothing', 'Water'], locationId: 'loc2'),
    ];
  }
}
""",
    "mock_report_repository.dart": """import '../report_repository.dart';
import '../../models/disaster_report_model.dart';

class MockReportRepository implements ReportRepository {
  @override
  Future<List<DisasterReport>> getRecentReports(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      DisasterReport(id: 'r1', type: 'Flood', description: 'Roads blocked due to heavy water logging.', severity: 'High', locationId: 'loc1', timestamp: DateTime.now()),
      DisasterReport(id: 'r2', type: 'Fallen Tree', description: 'Tree blocking the main highway.', severity: 'Medium', locationId: 'loc2', timestamp: DateTime.now().subtract(const Duration(hours: 1))),
    ];
  }

  @override
  Future<void> submitReport(DisasterReport report) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
""",
    "mock_sos_repository.dart": """import '../sos_repository.dart';
import '../../models/sos_model.dart';

class MockSOSRepository implements SOSRepository {
  @override
  Future<Sos> triggerSOS(Sos sosData) async {
    await Future.delayed(const Duration(seconds: 1));
    return sosData.copyWith(id: 'sos_123', status: 'Active', timestamp: DateTime.now());
  }

  @override
  Future<void> cancelSOS(String sosId) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<Sos> getSOSStatus(String sosId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Sos(id: sosId, userId: 'u1', locationId: 'loc1', timestamp: DateTime.now(), status: 'Responders Dispatched');
  }
}
""",
    "mock_emergency_contact_repository.dart": """import '../emergency_contact_repository.dart';
import '../../models/emergency_contact_model.dart';

class MockEmergencyContactRepository implements EmergencyContactRepository {
  @override
  Future<List<EmergencyContact>> getEmergencyContacts() async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      EmergencyContact(id: 'ec1', name: 'Mom', phone: '+1234567890', relationship: 'Family'),
      EmergencyContact(id: 'ec2', name: 'Local Police', phone: '911', relationship: 'Authority'),
    ];
  }

  @override
  Future<void> addEmergencyContact(EmergencyContact contact) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> removeEmergencyContact(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
""",
    "mock_profile_repository.dart": """import '../profile_repository.dart';
import '../../models/profile_model.dart';

class MockProfileRepository implements ProfileRepository {
  @override
  Future<Profile> getProfile(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Profile(userId: userId, phoneNumber: '+1987654321', bloodGroup: 'O+', address: '789 Residential Area');
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
""",
    "mock_settings_repository.dart": """import '../settings_repository.dart';
import '../../models/settings_model.dart';
import '../../models/theme_settings_model.dart';

class MockSettingsRepository implements SettingsRepository {
  @override
  Future<Settings> getSettings() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const Settings(language: 'English', notificationsEnabled: true, themeSettingsId: 'theme1');
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
""",
    "mock_offline_repository.dart": """import '../offline_repository.dart';
import '../../models/offline_guide_model.dart';

class MockOfflineRepository implements OfflineRepository {
  @override
  Future<List<OfflineGuide>> getOfflineGuides() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      OfflineGuide(id: 'og1', title: 'Earthquake Safety', content: 'Drop, Cover, and Hold on...', category: 'Earthquake'),
      OfflineGuide(id: 'og2', title: 'First Aid Basics', content: 'CPR instructions...', category: 'Medical'),
    ];
  }

  @override
  Future<void> saveOfflineGuides(List<OfflineGuide> guides) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<bool> isOfflineReady() async {
    return true;
  }
}
""",
    "mock_ai_repository.dart": """import '../ai_repository.dart';
import '../../models/ai_message_model.dart';

class MockAIRepository implements AIRepository {
  @override
  Future<AiMessage> sendMessage(String message) async {
    await Future.delayed(const Duration(seconds: 1));
    return AiMessage(id: 'ai_msg1', text: 'I am here to help you. Based on your current location, the nearest shelter is 2km away.', isUser: false, timestamp: DateTime.now());
  }

  @override
  Future<List<AiMessage>> getChatHistory(String sessionId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      AiMessage(id: 'usr_msg1', text: 'What should I do during a flood?', isUser: true, timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
      AiMessage(id: 'ai_msg2', text: 'Move to higher ground immediately and avoid walking through floodwaters.', isUser: false, timestamp: DateTime.now().subtract(const Duration(minutes: 1))),
    ];
  }
}
""",
    "mock_chat_repository.dart": """import '../chat_repository.dart';
import '../../models/chat_message_model.dart';

class MockChatRepository implements ChatRepository {
  @override
  Future<List<ChatMessage>> getMessages(String channelId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      ChatMessage(id: 'msg1', senderId: 'user1', text: 'Has the rescue team arrived?', timestamp: DateTime.now().subtract(const Duration(minutes: 10))),
      ChatMessage(id: 'msg2', senderId: 'responder1', text: 'We are 5 minutes away.', timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
    ];
  }

  @override
  Future<void> sendMessage(String channelId, ChatMessage message) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
""",
    "mock_government_alert_repository.dart": """import '../government_alert_repository.dart';
import '../../models/government_alert_model.dart';

class MockGovernmentAlertRepository implements GovernmentAlertRepository {
  @override
  Future<List<GovernmentAlert>> getGovernmentAlerts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      GovernmentAlert(id: 'ga1', title: 'Evacuation Order', description: 'Mandatory evacuation for coastal areas.', source: 'National Disaster Management Authority', timestamp: DateTime.now()),
    ];
  }
}
""",
    "mock_route_repository.dart": """import '../route_repository.dart';
import '../../models/route_model.dart';
import '../../models/route_step_model.dart';

class MockRouteRepository implements RouteRepository {
  @override
  Future<Route> getRoute(double startLat, double startLng, double endLat, double endLng) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Route(
      distance: '5.2 km',
      duration: '15 mins',
      steps: [
        RouteStep(instruction: 'Head north on Main St', distance: '1 km', duration: '3 mins'),
        RouteStep(instruction: 'Turn right at the hospital', distance: '4.2 km', duration: '12 mins'),
      ],
    );
  }
}
"""
}

for filename, content in files.items():
    with open(os.path.join(mock_dir, filename), "w") as f:
        f.write(content)
