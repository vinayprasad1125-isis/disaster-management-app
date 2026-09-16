import 'package:flutter/material.dart';
import '../../../../models/relief_center_model.dart';
import '../../../../shared/widgets/custom_button.dart';

class ReliefCenterDetailScreen extends StatelessWidget {
  final ReliefCenter center;
  const ReliefCenterDetailScreen({super.key, required this.center});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(center.name)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resources Available',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: center.resources
                  .map((r) => Chip(label: Text(r)))
                  .toList(),
            ),
            const Spacer(),
            CustomButton(text: 'Get Directions', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
