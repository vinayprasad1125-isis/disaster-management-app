import os

base_dir = "frontend/lib/features/offline_communication/presentation"
screens_dir = os.path.join(base_dir, "screens")
widgets_dir = os.path.join(base_dir, "widgets")

os.makedirs(screens_dir, exist_ok=True)
os.makedirs(widgets_dir, exist_ok=True)

# 1. RIPPLE ANIMATION
ripple_content = """import 'package:flutter/material.dart';

class RippleAnimation extends StatefulWidget {
  final Widget child;
  final Color color;
  
  const RippleAnimation({super.key, required this.child, required this.color});

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100 + (_controller.value * 200),
              height: 100 + (_controller.value * 200),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color.withOpacity(1.0 - _controller.value),
              ),
            ),
            widget.child,
          ],
        );
      },
      child: widget.child,
    );
  }
}
"""

with open(os.path.join(widgets_dir, "ripple_animation.dart"), "w") as f:
    f.write(ripple_content)


# 2. EMERGENCY CALLING SCREEN
calling_content = """import 'package:flutter/material.dart';
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
                style: TextStyle(color: colorScheme.onErrorContainer, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 60,
              backgroundColor: colorScheme.primaryContainer,
              child: Icon(Icons.person, size: 60, color: colorScheme.onPrimaryContainer),
            ),
            const SizedBox(height: 24),
            Text(
              widget.peerName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
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

  Widget _buildActionButton({required IconData icon, required String label, bool isActive = false, required VoidCallback onTap}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(32),
          child: CircleAvatar(
            radius: 32,
            backgroundColor: isActive ? colorScheme.primaryContainer : colorScheme.surfaceContainerHighest,
            child: Icon(
              icon,
              color: isActive ? colorScheme.onPrimaryContainer : colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
"""

with open(os.path.join(screens_dir, "emergency_calling_screen.dart"), "w") as f:
    f.write(calling_content)


# 3. EMERGENCY CHAT SCREEN
chat_content = """import 'package:flutter/material.dart';

class EmergencyChatScreen extends StatefulWidget {
  final String peerName;
  const EmergencyChatScreen({super.key, required this.peerName});

  @override
  State<EmergencyChatScreen> createState() => _EmergencyChatScreenState();
}

class _EmergencyChatScreenState extends State<EmergencyChatScreen> {
  final List<String> _messages = ["Are you okay?", "I have water."];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _messages.add(text.trim());
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.peerName),
        actions: [
          IconButton(icon: const Icon(Icons.call), onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final isMe = index > 1; // mock logic
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? colorScheme.primary : colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      _messages[index],
                      style: TextStyle(color: isMe ? colorScheme.onPrimary : colorScheme.onSurface),
                    ),
                  ),
                );
              },
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                _QuickReplyButton(text: '🆘 Need Help', onTap: () => _sendMessage('SOS Need Help!')),
                _QuickReplyButton(text: '🚑 Medical', onTap: () => _sendMessage('Need Medical Assistance!')),
                _QuickReplyButton(text: '✅ Safe', onTap: () => _sendMessage('I am safe.')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type message...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                      filled: true,
                      fillColor: colorScheme.surfaceContainerHighest,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: colorScheme.primary,
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _QuickReplyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _QuickReplyButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ActionChip(
        label: Text(text),
        onPressed: onTap,
      ),
    );
  }
}
"""

with open(os.path.join(screens_dir, "emergency_chat_screen.dart"), "w") as f:
    f.write(chat_content)


# 4. SOS BOTTOM SHEET
bottom_sheet_content = """import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';

class SOSBottomSheet extends StatelessWidget {
  const SOSBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const SOSBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.onSurfaceVariant.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Emergency Actions',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.radar)),
            title: const Text('Contact Nearby Devices (Offline)'),
            subtitle: const Text('Connect via Bluetooth/Wi-Fi Direct'),
            onTap: () {
              context.pop();
              context.push(AppRoutes.nearbyDevices);
            },
          ),
          ListTile(
            leading: const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.sos, color: Colors.white)),
            title: const Text('Broadcast Global SOS'),
            subtitle: const Text('Send alerts to authorities (Requires internet)'),
            onTap: () {
              context.pop();
              context.push(AppRoutes.sos);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
"""

with open(os.path.join(widgets_dir, "sos_bottom_sheet.dart"), "w") as f:
    f.write(bottom_sheet_content)
