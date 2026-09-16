import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final double radius;

  const AvatarWidget({super.key, this.imageUrl, this.name, this.radius = 24.0});

  @override
  Widget build(BuildContext context) {
    final initials = (name != null && name!.isNotEmpty)
        ? name!
              .trim()
              .split(' ')
              .take(2)
              .map((e) => e[0].toUpperCase())
              .join('')
        : '?';

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(imageUrl!),
        onBackgroundImageError: (_, __) {},
        child: const SizedBox.shrink(),
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Text(
        initials,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: radius * 0.8),
      ),
    );
  }
}
