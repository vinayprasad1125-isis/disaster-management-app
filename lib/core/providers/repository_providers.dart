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
import '../../repositories/api/api_auth_repository.dart';
import '../../repositories/api/api_weather_repository.dart';
import '../../repositories/api/api_alert_repository.dart';
import '../../repositories/api/api_notification_repository.dart';
import '../../repositories/api/api_map_repository.dart';
import '../../repositories/api/api_shelter_repository.dart';
import '../../repositories/api/api_volunteer_repository.dart';
import '../../repositories/api/api_relief_center_repository.dart';
import '../../repositories/api/api_report_repository.dart';
import '../../repositories/api/api_sos_repository.dart';
import '../../repositories/api/api_emergency_contact_repository.dart';
import '../../repositories/api/api_profile_repository.dart';
import '../../repositories/api/api_settings_repository.dart';
import '../../repositories/api/api_offline_repository.dart';
import '../../repositories/api/api_ai_repository.dart';
import '../../repositories/api/api_chat_repository.dart';
import '../../repositories/api/api_government_alert_repository.dart';
import '../../repositories/api/api_route_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => ApiAuthRepository(),
);
final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => ApiWeatherRepository(),
);
final alertRepositoryProvider = Provider<AlertRepository>(
  (ref) => ApiAlertRepository(),
);
final notificationRepositoryProvider = Provider<NotificationRepository>(
  (ref) => ApiNotificationRepository(),
);
final mapRepositoryProvider = Provider<MapRepository>(
  (ref) => ApiMapRepository(),
);
final shelterRepositoryProvider = Provider<ShelterRepository>(
  (ref) => ApiShelterRepository(),
);
final volunteerRepositoryProvider = Provider<VolunteerRepository>(
  (ref) => ApiVolunteerRepository(),
);
final reliefCenterRepositoryProvider = Provider<ReliefCenterRepository>(
  (ref) => ApiReliefCenterRepository(),
);
final reportRepositoryProvider = Provider<ReportRepository>(
  (ref) => ApiReportRepository(),
);
final sosRepositoryProvider = Provider<SOSRepository>(
  (ref) => ApiSOSRepository(),
);
final emergencyContactRepositoryProvider = Provider<EmergencyContactRepository>(
  (ref) => ApiEmergencyContactRepository(),
);
final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ApiProfileRepository(),
);
final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => ApiSettingsRepository(),
);
final offlineRepositoryProvider = Provider<OfflineRepository>(
  (ref) => ApiOfflineRepository(),
);
final aiRepositoryProvider = Provider<AIRepository>(
  (ref) => ApiAIRepository(),
);
final chatRepositoryProvider = Provider<ChatRepository>(
  (ref) => ApiChatRepository(),
);
final governmentAlertRepositoryProvider = Provider<GovernmentAlertRepository>(
  (ref) => ApiGovernmentAlertRepository(),
);
final routeRepositoryProvider = Provider<RouteRepository>(
  (ref) => ApiRouteRepository(),
);
