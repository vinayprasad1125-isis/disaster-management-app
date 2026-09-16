import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class EmergencyCallingScreen extends StatefulWidget {
  final String peerName;
  const EmergencyCallingScreen({super.key, required this.peerName});

  @override
  State<EmergencyCallingScreen> createState() => _EmergencyCallingScreenState();
}

class _EmergencyCallingScreenState extends State<EmergencyCallingScreen> {
  int _seconds = 0;
  Timer? _timer;
  bool _isMuted = false;
  bool _isSpeaker = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    int minutes = _seconds ~/ 60;
    int remainingSeconds = _seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'MOCK CALL: Wi-Fi Direct',
                style: TextStyle(
                  color: colorScheme.onErrorContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 60,
              backgroundColor: colorScheme.primaryContainer,
              child: Icon(
                Icons.person,
                size: 60,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.peerName,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _formattedTime,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: _isMuted ? Icons.mic_off : Icons.mic,
                  label: 'Mute',
                  isActive: _isMuted,
                  onTap: () => setState(() => _isMuted = !_isMuted),
                ),
                _buildActionButton(
                  icon: Icons.chat,
                  label: 'Emergency Chat',
                  onTap: () {
                    context.pop();
                  },
                ),
                _buildActionButton(
                  icon: _isSpeaker ? Icons.volume_up : Icons.volume_down,
                  label: 'Speaker',
                  isActive: _isSpeaker,
                  onTap: () => setState(() => _isSpeaker = !_isSpeaker),
                ),
              ],
            ),
            const SizedBox(height: 48),
            FloatingActionButton.large(
              onPressed: () => context.pop(),
              backgroundColor: Colors.red,
              child: const Icon(Icons.call_end, color: Colors.white, size: 36),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    bool isActive = false,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(32),
          child: CircleAvatar(
            radius: 32,
            backgroundColor: isActive
                ? colorScheme.primaryContainer
                : colorScheme.surfaceContainerHighest,
            child: Icon(
              icon,
              color: isActive
                  ? colorScheme.onPrimaryContainer
                  : colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
