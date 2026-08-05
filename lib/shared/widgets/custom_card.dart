import 'package:flutter/material.dart';

enum CustomCardType { elevated, outlined, filled }

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final CustomCardType type;
  final Color? color;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.type = CustomCardType.elevated,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: type == CustomCardType.outlined
          ? BorderSide(color: Theme.of(context).colorScheme.outlineVariant)
          : BorderSide.none,
    );

    final cardColor = type == CustomCardType.filled
        ? Theme.of(context).colorScheme.surfaceContainerHighest
        : color;

    final elevation = type == CustomCardType.elevated ? 1.0 : 0.0;

    return Card(
      elevation: elevation,
      shape: shape,
      color: cardColor,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
