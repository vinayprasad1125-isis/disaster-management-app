import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/sos_provider.dart';
import '../../../offline_communication/presentation/widgets/sos_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class SOSScreen extends ConsumerStatefulWidget {
  const SOSScreen({super.key});

  @override
  ConsumerState<SOSScreen> createState() => _SOSScreenState();
}

class _SOSScreenState extends ConsumerState<SOSScreen>
    with SingleTickerProviderStateMixin {
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

  void _cancelCountdown() {
    _timer?.cancel();
    setState(() {
      _isCountdownActive = false;
      _countdown = 5;
    });
  }

  Future<void> _cancelActiveSOS() async {
    final sosState = ref.read(sosViewModelProvider);
    if (sosState.value != null) {
      await ref
          .read(sosViewModelProvider.notifier)
          .cancelSOS(sosState.value!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sosState = ref.watch(sosViewModelProvider);
    final bool isSosActive =
        sosState.value != null && sosState.value!.status == 'active';
    final isLoading = sosState.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency SOS'),
        backgroundColor: isSosActive
            ? Theme.of(context).colorScheme.error
            : null,
        foregroundColor: isSosActive
            ? Theme.of(context).colorScheme.onError
            : null,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 16,
                    ),
                  ),
                ),
              ] else ...[
                ScaleTransition(
                  scale: _pulseAnimation,
                  child: GestureDetector(
                    onTapDown: (_) => SOSBottomSheet.show(context),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.error,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(
                              context,
                            ).colorScheme.error.withValues(alpha: 0.5),
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
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      if (context.mounted) {
                        context.push('/offline_walkie_talkie/home');
                      }
                    },
                    icon: const Icon(Icons.radio),
                    label: const Text('📻 Offline Walkie-Talkie'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
