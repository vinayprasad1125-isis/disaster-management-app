import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';
import '../widgets/placeholder_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/weather/presentation/screens/weather_screen.dart';
import '../../features/map_shelters/presentation/screens/map_screen.dart';
import '../../features/map_shelters/presentation/screens/shelter_list_screen.dart';
import '../../features/sos_alerts/presentation/screens/sos_screen.dart';
import '../../features/sos_alerts/presentation/screens/alert_list_screen.dart';
import '../../features/reports/presentation/screens/report_list_screen.dart';
import '../../features/services/presentation/screens/relief_center_list_screen.dart';
import '../../features/services/presentation/screens/volunteer_list_screen.dart';
import '../../features/services/presentation/screens/emergency_contacts_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/profile/presentation/screens/settings_screen.dart';
import '../../features/offline/presentation/screens/offline_guides_screen.dart';
import '../../features/offline_ai/presentation/screens/offline_ai_chat_screen.dart';
import '../../features/offline_communication/presentation/screens/offline_communication_home.dart';
import '../../features/offline_communication/presentation/screens/nearby_devices_screen.dart';
import '../../features/offline_communication/presentation/screens/emergency_calling_screen.dart';
import '../../features/offline_communication/presentation/screens/emergency_chat_screen.dart';

// Offline Walkie Talkie Feature
import '../../features/offline_walkie_talkie/presentation/screens/walkie_talkie_home_screen.dart';
import '../../features/offline_walkie_talkie/presentation/screens/searching_screen.dart';
import '../../features/offline_walkie_talkie/presentation/screens/nearby_devices_screen.dart' as wt_devices;
import '../../features/offline_walkie_talkie/presentation/screens/incoming_connection_screen.dart';
import '../../features/offline_walkie_talkie/presentation/screens/walkie_talkie_screen.dart';
import '../../features/offline_walkie_talkie/presentation/screens/call_history_screen.dart';

// Assuming an auth provider exists to check if user is logged in
// For now, we simulate an unauthenticated state for route guards
final authStateProvider = StateProvider<bool>((ref) => false);
final initialLaunchProvider = StateProvider<bool>((ref) => true);

final goRouterProvider = Provider<GoRouter>((ref) {
  final isAuth = ref.watch(authStateProvider);
  final isInitialLaunch = ref.watch(initialLaunchProvider);

  return GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isGoingToSplash = state.uri.toString() == AppRoutes.splash;
      final isGoingToAuth =
          state.uri.toString() == AppRoutes.login ||
          state.uri.toString() == AppRoutes.register ||
          state.uri.toString() == AppRoutes.forgotPassword;

      // Add real redirect logic once Auth is fully implemented
      if (isInitialLaunch && !isGoingToSplash) {
        // Here we could redirect to onboarding if needed
      }

      // If user is authenticated and trying to go to login, redirect to home
      if (isAuth && isGoingToAuth) {
        return AppRoutes.home;
      }

      return null; // No redirect
    },
    errorBuilder: (context, state) =>
        const PlaceholderScreen(title: '404 - Unknown Route'),
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const PlaceholderScreen(title: 'Splash'),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) =>
            const PlaceholderScreen(title: 'Onboarding'),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.guestLogin,
        builder: (context, state) =>
            const PlaceholderScreen(title: 'Guest Login'),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.weather,
        builder: (context, state) => const WeatherScreen(),
      ),
      GoRoute(
        path: AppRoutes.maps,
        builder: (context, state) => const MapScreen(),
      ),
      GoRoute(
        path: AppRoutes.alerts,
        builder: (context, state) => const AlertListScreen(),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) =>
            const PlaceholderScreen(title: 'Notifications'),
      ),
      GoRoute(
        path: AppRoutes.sos,
        builder: (context, state) => const SOSScreen(),
      ),
      GoRoute(
        path: AppRoutes.reports,
        builder: (context, state) => const ReportListScreen(),
      ),
      GoRoute(
        path: AppRoutes.shelters,
        builder: (context, state) => const ShelterListScreen(),
      ),
      GoRoute(
        path: AppRoutes.reliefCenters,
        builder: (context, state) => const ReliefCenterListScreen(),
      ),
      GoRoute(
        path: AppRoutes.volunteers,
        builder: (context, state) => const VolunteerListScreen(),
      ),
      GoRoute(
        path: AppRoutes.emergencyContacts,
        builder: (context, state) => const EmergencyContactsScreen(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.offline,
        builder: (context, state) => const OfflineGuidesScreen(),
      ),
      GoRoute(
        path: AppRoutes.aiAssistant,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const OfflineAIChatScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: AppRoutes.chat,
        builder: (context, state) => const PlaceholderScreen(title: 'Chat'),
      ),
      GoRoute(
        path: AppRoutes.offlineCommunication,
        builder: (context, state) => const OfflineCommunicationHome(),
      ),
      GoRoute(
        path: AppRoutes.nearbyDevices,
        builder: (context, state) => const NearbyDevicesScreen(),
      ),
      GoRoute(
        path: AppRoutes.offlineCall,
        builder: (context, state) {
          final peerName = state.extra as String? ?? 'Unknown Peer';
          return EmergencyCallingScreen(peerName: peerName);
        },
      ),
      GoRoute(
        path: AppRoutes.offlineChat,
        builder: (context, state) {
          final peerName = state.extra as String? ?? 'Unknown Peer';
          return EmergencyChatScreen(peerName: peerName);
        },
      ),
      // Offline Walkie Talkie Feature
      GoRoute(
        path: '/offline_walkie_talkie/home',
        builder: (context, state) => const WalkieTalkieHomeScreen(),
      ),
      GoRoute(
        path: '/offline_walkie_talkie/search',
        builder: (context, state) => const SearchingScreen(),
      ),
      GoRoute(
        path: '/offline_walkie_talkie/devices',
        builder: (context, state) => const wt_devices.NearbyDevicesScreen(),
      ),
      GoRoute(
        path: '/offline_walkie_talkie/incoming',
        builder: (context, state) => const IncomingConnectionScreen(),
      ),
      GoRoute(
        path: '/offline_walkie_talkie/chat',
        builder: (context, state) => const WalkieTalkieScreen(),
      ),
      GoRoute(
        path: '/offline_walkie_talkie/history',
        builder: (context, state) => const CallHistoryScreen(),
      ),
    ],
  );
});
