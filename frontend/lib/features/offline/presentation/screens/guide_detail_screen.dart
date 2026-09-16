import 'package:flutter/material.dart';
import '../../../../models/offline_guide_model.dart';

class GuideDetailScreen extends StatelessWidget {
  final OfflineGuide guide;
  const GuideDetailScreen({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(guide.category)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              guide.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(guide.content, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
