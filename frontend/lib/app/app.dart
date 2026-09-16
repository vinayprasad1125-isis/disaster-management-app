import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/routes/app_router.dart';
import '../core/theme/app_theme.dart';
import '../providers/theme_provider.dart';

class DisasterManagementApp extends ConsumerWidget {
  const DisasterManagementApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Disaster Management App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
