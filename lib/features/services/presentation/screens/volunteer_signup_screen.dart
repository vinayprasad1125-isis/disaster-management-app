import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/volunteer_viewmodel.dart';
import '../../../../models/volunteer_model.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';

class VolunteerSignupScreen extends ConsumerStatefulWidget {
  const VolunteerSignupScreen({super.key});
  @override
  ConsumerState<VolunteerSignupScreen> createState() =>
      _VolunteerSignupScreenState();
}

class _VolunteerSignupScreenState extends ConsumerState<VolunteerSignupScreen> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CustomTextField(label: 'Full Name', controller: _nameController),
            const Spacer(),
            CustomButton(
              text: 'Register',
              onPressed: () {
                final v = Volunteer(
                  id: 'new_vol',
                  name: _nameController.text,
                  skills: ['First Aid'],
                  availability: 'Weekends',
                  locationId: 'loc1',
                );
                ref.read(volunteerViewModelProvider.notifier).register(v);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
