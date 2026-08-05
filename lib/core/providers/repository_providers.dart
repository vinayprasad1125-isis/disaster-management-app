import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import Interfaces
import '../../repositories/auth_repository.dart';
import '../../repositories/weather_repository.dart';
import '../../repositories/alert_repository.dart';
import '../../repositories/notification_repository.dart';
import '../../repositories/map_repository.dart';
import '../../repositories/shelter_repository.dart';
import '../../repositories/volunteer_repository.dart';
import '../../repositories/relief_center_repository.dart';
import '../../repositories/report_repository.dart';
import '../../repositories/sos_repository.dart';
import '../../repositories/emergency_contact_repository.dart';
import '../../repositories/profile_repository.dart';
import '../../repositories/settings_repository.dart';
import '../../repositories/offline_repository.dart';
import '../../repositories/ai_repository.dart';
import '../../repositories/chat_repository.dart';
import '../../repositories/government_alert_repository.dart';
import '../../repositories/route_repository.dart';

// Import Mocks
import '../../repositories/mock/mock_auth_repository.dart';
import '../../repositories/mock/mock_weather_repository.dart';
import '../../repositories/mock/mock_alert_repository.dart';
import '../../repositories/mock/mock_notification_repository.dart';
import '../../repositories/mock/mock_map_repository.dart';
import '../../repositories/mock/mock_shelter_repository.dart';
import '../../repositories/mock/mock_volunteer_repository.dart';
import '../../repositories/mock/mock_relief_center_repository.dart';
import '../../repositories/mock/mock_report_repository.dart';
import '../../repositories/mock/mock_sos_repository.dart';
import '../../repositories/mock/mock_emergency_contact_repository.dart';
import '../../repositories/mock/mock_profile_repository.dart';
import '../../repositories/mock/mock_settings_repository.dart';
import '../../repositories/mock/mock_offline_repository.dart';
import '../../repositories/mock/mock_ai_repository.dart';
import '../../repositories/mock/mock_chat_repository.dart';
import '../../repositories/mock/mock_government_alert_repository.dart';
import '../../repositories/mock/mock_route_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => MockAuthRepository(),
);
final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => MockWeatherRepository(),
);
final alertRepositoryProvider = Provider<AlertRepository>(
  (ref) => MockAlertRepository(),
);
final notificationRepositoryProvider = Provider<NotificationRepository>(
  (ref) => MockNotificationRepository(),
);
final mapRepositoryProvider = Provider<MapRepository>(
  (ref) => MockMapRepository(),
);
final shelterRepositoryProvider = Provider<ShelterRepository>(
  (ref) => MockShelterRepository(),
);
final volunteerRepositoryProvider = Provider<VolunteerRepository>(
  (ref) => MockVolunteerRepository(),
);
final reliefCenterRepositoryProvider = Provider<ReliefCenterRepository>(
  (ref) => MockReliefCenterRepository(),
);
final reportRepositoryProvider = Provider<ReportRepository>(
  (ref) => MockReportRepository(),
);
final sosRepositoryProvider = Provider<SOSRepository>(
  (ref) => MockSOSRepository(),
);
final emergencyContactRepositoryProvider = Provider<EmergencyContactRepository>(
  (ref) => MockEmergencyContactRepository(),
);
final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => MockProfileRepository(),
);
final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => MockSettingsRepository(),
);
final offlineRepositoryProvider = Provider<OfflineRepository>(
  (ref) => MockOfflineRepository(),
);
final aiRepositoryProvider = Provider<AIRepository>(
  (ref) => MockAIRepository(),
);
final chatRepositoryProvider = Provider<ChatRepository>(
  (ref) => MockChatRepository(),
);
final governmentAlertRepositoryProvider = Provider<GovernmentAlertRepository>(
  (ref) => MockGovernmentAlertRepository(),
);
final routeRepositoryProvider = Provider<RouteRepository>(
  (ref) => MockRouteRepository(),
);
