import os

sos_alerts_dir = "frontend/lib/features/sos_alerts/presentation/screens"
os.makedirs(sos_alerts_dir, exist_ok=True)

files = {
    "sos_screen.dart": """import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/sos_viewmodel.dart';
import '../../../../models/sos_model.dart';

class SOSScreen extends ConsumerStatefulWidget {
  const SOSScreen({super.key});

  @override
  ConsumerState<SOSScreen> createState() => _SOSScreenState();
}

class _SOSScreenState extends ConsumerState<SOSScreen> with SingleTickerProviderStateMixin {
  bool _isCountdownActive = false;
  int _countdown = 5;
  Timer? _timer;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  void _startCountdown() {
    setState(() {
      _isCountdownActive = true;
      _countdown = 5;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        _timer?.cancel();
        _triggerSOS();
      }
    });
  }

  void _cancelCountdown() {
    _timer?.cancel();
    setState(() {
      _isCountdownActive = false;
      _countdown = 5;
    });
  }

  Future<void> _triggerSOS() async {
    setState(() {
      _isCountdownActive = false;
    });
    
    final sosData = Sos(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: 'current_user_123',
      locationId: 'loc_123',
      timestamp: DateTime.now(),
      status: 'active',
    );
    
    await ref.read(sosViewModelProvider.notifier).triggerSOS(sosData);
  }

  Future<void> _cancelActiveSOS() async {
    final sosState = ref.read(sosViewModelProvider);
    if (sosState.value != null) {
      await ref.read(sosViewModelProvider.notifier).cancelSOS(sosState.value!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sosState = ref.watch(sosViewModelProvider);
    final bool isSosActive = sosState.value != null && sosState.value!.status == 'active';
    final isLoading = sosState.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency SOS'),
        backgroundColor: isSosActive ? Theme.of(context).colorScheme.error : null,
        foregroundColor: isSosActive ? Theme.of(context).colorScheme.onError : null,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSosActive) ...[
                const Icon(Icons.warning, size: 80, color: Colors.red),
                const SizedBox(height: 24),
                Text(
                  'SOS SIGNAL ACTIVE',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your location has been shared with emergency responders. Stay calm and remain in a safe location if possible.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                ElevatedButton.icon(
                  onPressed: isLoading ? null : _cancelActiveSOS,
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel SOS'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                ),
              ] else if (_isCountdownActive) ...[
                Text(
                  '$_countdown',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 120,
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Sending SOS...',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 48),
                ElevatedButton.icon(
                  onPressed: _cancelCountdown,
                  icon: const Icon(Icons.close),
                  label: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  ),
                ),
              ] else ...[
                ScaleTransition(
                  scale: _pulseAnimation,
                  child: GestureDetector(
                    onTap: _startCountdown,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.error,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.error.withValues(alpha: 0.5),
                            blurRadius: 30,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'SOS',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onError,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Text(
                  'Tap the button to alert emergency services.',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
""",
    "alert_list_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../viewmodels/alerts_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../../../shared/widgets/custom_error_widget.dart';
import 'alert_detail_screen.dart';

class AlertListScreen extends ConsumerStatefulWidget {
  const AlertListScreen({super.key});

  @override
  ConsumerState<AlertListScreen> createState() => _AlertListScreenState();
}

class _AlertListScreenState extends ConsumerState<AlertListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(alertsViewModelProvider.notifier).fetchAlerts(0.0, 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final alertsState = ref.watch(alertsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Alerts'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(alertsViewModelProvider.notifier).fetchAlerts(0.0, 0.0);
        },
        child: alertsState.when(
          data: (alerts) {
            if (alerts.isEmpty) {
              return const EmptyStateWidget(
                title: 'No Active Alerts',
                message: 'Your area is currently safe.',
                icon: Icons.check_circle_outline,
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: alerts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final alert = alerts[index];
                final isSevere = alert.severity.toLowerCase() == 'severe' || alert.severity.toLowerCase() == 'extreme';
                
                return CustomCard(
                  type: CustomCardType.outlined,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AlertDetailScreen(alert: alert),
                      ),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: isSevere 
                          ? Theme.of(context).colorScheme.errorContainer 
                          : Theme.of(context).colorScheme.tertiaryContainer,
                      child: Icon(
                        Icons.warning_amber_rounded,
                        color: isSevere 
                            ? Theme.of(context).colorScheme.onErrorContainer 
                            : Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                    title: Text(
                      alert.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DateFormat('MMM dd, yyyy - HH:mm').format(alert.timestamp),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => CustomErrorWidget(
            message: err.toString(),
            onRetry: () => ref.read(alertsViewModelProvider.notifier).fetchAlerts(0.0, 0.0),
          ),
        ),
      ),
    );
  }
}
""",
    "alert_detail_screen.dart": """import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../models/alert_model.dart';
import '../../../../shared/widgets/custom_button.dart';

class AlertDetailScreen extends StatelessWidget {
  final Alert alert;

  const AlertDetailScreen({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    final isSevere = alert.severity.toLowerCase() == 'severe' || alert.severity.toLowerCase() == 'extreme';
    final headerColor = isSevere ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.tertiary;
    final onHeaderColor = isSevere ? Theme.of(context).colorScheme.onError : Theme.of(context).colorScheme.onTertiary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Details'),
        backgroundColor: headerColor,
        foregroundColor: onHeaderColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: headerColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                alert.severity.toUpperCase(),
                style: TextStyle(
                  color: headerColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              alert.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Issued: ${DateFormat('MMM dd, yyyy - HH:mm').format(alert.timestamp)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 32),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              alert.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 48),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Recommended Actions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            _buildActionItem(context, 'Follow local authorities instructions'),
            _buildActionItem(context, 'Prepare emergency kit'),
            _buildActionItem(context, 'Stay tuned to local news'),
            const SizedBox(height: 48),
            CustomButton(
              text: 'View Evacuation Map',
              icon: const Icon(Icons.map),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
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
    full_path = os.path.join(sos_alerts_dir, filename)
    with open(full_path, "w") as f:
        f.write(content)
