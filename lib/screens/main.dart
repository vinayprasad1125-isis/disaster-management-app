import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/sos_screen.dart';
import 'screens/emergency_contacts_screen.dart';
import 'screens/offline_resources_screen.dart';
import 'screens/offline_chat_screen.dart';
'/offlineChat': (context) => const OfflineChatScreen(),


void main() {
  runApp(const DisasterManagementApp());
}

class DisasterManagementApp extends StatelessWidget {
  const DisasterManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disaster Management',
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/sos': (context) => const SOSScreen(),
        '/contacts': (context) => const EmergencyContactsScreen(),
        '/resources': (context) => const OfflineResourcesScreen(),
      },
    );
  }
}Navigator.pushNamed(
  context,
  '/offlineChat',
);

