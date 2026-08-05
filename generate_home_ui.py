import os

home_dir = "lib/features/home/presentation/screens"
widgets_dir = "lib/features/home/presentation/widgets"

os.makedirs(home_dir, exist_ok=True)
os.makedirs(widgets_dir, exist_ok=True)

files = {
    "screens/home_screen.dart": """import 'package:flutter/material.dart';
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
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(weatherViewModelProvider.notifier).refreshWeather(0.0, 0.0);
          ref.read(alertsViewModelProvider.notifier).fetchAlerts(0.0, 0.0);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
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
""",
    "widgets/custom_bottom_nav_bar.dart": """import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.map_outlined),
          selectedIcon: Icon(Icons.map),
          label: 'Map',
        ),
        NavigationDestination(
          icon: Icon(Icons.warning_amber_outlined),
          selectedIcon: Icon(Icons.warning),
          label: 'Reports',
        ),
        NavigationDestination(
          icon: Icon(Icons.chat_bubble_outline),
          selectedIcon: Icon(Icons.chat_bubble),
          label: 'Assistant',
        ),
      ],
    );
  }
}
""",
    "widgets/weather_summary_widget.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/weather_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';

class WeatherSummaryWidget extends ConsumerWidget {
  const WeatherSummaryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherViewModelProvider);

    return CustomCard(
      type: CustomCardType.filled,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: weatherState.when(
        data: (weather) {
          if (weather == null) return const Text('No weather data available.');
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Weather',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\${weather.temperature}°C - \${weather.condition}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                ],
              ),
              Icon(
                Icons.cloud,
                size: 48,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Text('Error: $err'),
      ),
    );
  }
}
""",
    "widgets/active_alerts_widget.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/alerts_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';
import '../../../../shared/widgets/empty_state_widget.dart';

class ActiveAlertsWidget extends ConsumerWidget {
  const ActiveAlertsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertsState = ref.watch(alertsViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Active Alerts',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        alertsState.when(
          data: (alerts) {
            if (alerts.isEmpty) {
              return const EmptyStateWidget(
                title: 'No Alerts',
                message: 'There are no active alerts in your area.',
                icon: Icons.check_circle_outline,
              );
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: alerts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final alert = alerts[index];
                return CustomCard(
                  type: CustomCardType.outlined,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.errorContainer,
                      child: Icon(
                        Icons.warning_amber_rounded,
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                    ),
                    title: Text(
                      alert.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(alert.description),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Text('Error: $err'),
        ),
      ],
    );
  }
}
""",
    "widgets/quick_actions_widget.dart": """import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ActionItem(
              icon: Icons.report_problem,
              label: 'Report',
              color: Theme.of(context).colorScheme.primary,
              onTap: () => context.push(AppRoutes.reports),
            ),
            _ActionItem(
              icon: Icons.sos,
              label: 'SOS',
              color: Theme.of(context).colorScheme.error,
              onTap: () => context.push(AppRoutes.sos),
            ),
            _ActionItem(
              icon: Icons.map,
              label: 'Map',
              color: Theme.of(context).colorScheme.secondary,
              onTap: () => context.push(AppRoutes.maps),
            ),
            _ActionItem(
              icon: Icons.house,
              label: 'Shelters',
              color: Theme.of(context).colorScheme.tertiary,
              onTap: () => context.push(AppRoutes.shelters),
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: color.withValues(alpha: 0.1),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
"""
}

for filename, content in files.items():
    full_path = os.path.join("lib/features/home/presentation", filename)
    with open(full_path, "w") as f:
        f.write(content)
