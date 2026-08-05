import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/weather_summary_widget.dart';
import '../widgets/active_alerts_widget.dart';
import '../widgets/quick_actions_widget.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../../../../viewmodels/weather_viewmodel.dart';
import '../../../../viewmodels/alerts_viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // In a real app we'd fetch based on GPS coordinates
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(weatherViewModelProvider.notifier).refreshWeather(0.0, 0.0);
      ref.read(alertsViewModelProvider.notifier).fetchAlerts(0.0, 0.0);
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Add routing logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(icon: const Icon(Icons.person_outline), onPressed: () {}),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(weatherViewModelProvider.notifier).refreshWeather(0.0, 0.0);
          ref.read(alertsViewModelProvider.notifier).fetchAlerts(0.0, 0.0);
        },
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WeatherSummaryWidget(),
              SizedBox(height: 24),
              ActiveAlertsWidget(),
              SizedBox(height: 24),
              QuickActionsWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
