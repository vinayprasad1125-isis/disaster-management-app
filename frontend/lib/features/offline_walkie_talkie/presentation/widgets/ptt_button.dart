import 'package:flutter/material.dart';

class PttButton extends StatefulWidget {
  final VoidCallback onPressedDown;
  final VoidCallback onPressedUp;
  final bool isTransmitting;

  const PttButton({
    super.key,
    required this.onPressedDown,
    required this.onPressedUp,
    this.isTransmitting = false,
  });

  @override
  State<PttButton> createState() => _PttButtonState();
}

class _PttButtonState extends State<PttButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.9,
      upperBound: 1.0,
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.reverse();
    widget.onPressedDown();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.forward();
    widget.onPressedUp();
  }

  void _handleTapCancel() {
    _controller.forward();
    widget.onPressedUp();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: ScaleTransition(
        scale: _controller,
        child: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.isTransmitting ? theme.colorScheme.error : theme.colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: (widget.isTransmitting ? theme.colorScheme.error : theme.colorScheme.primary).withOpacity(0.4),
                blurRadius: widget.isTransmitting ? 30 : 15,
                spreadRadius: widget.isTransmitting ? 10 : 2,
              )
            ],
            border: Border.all(
              color: Colors.white24,
              width: 8,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mic,
                size: 64,
                color: widget.isTransmitting ? theme.colorScheme.onError : theme.colorScheme.onPrimary,
              ),
              const SizedBox(height: 8),
              Text(
                widget.isTransmitting ? 'RELEASE' : 'HOLD TO TALK',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: widget.isTransmitting ? theme.colorScheme.onError : theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
