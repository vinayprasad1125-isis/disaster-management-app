import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../providers/profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: state.when(
        data: (profile) {
          if (profile == null) {
            return const Center(child: Text('Profile not found'));
          }
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  ),
                ),
                const SizedBox(height: 24),
                ListTile(
                  title: const Text('Phone Number'),
                  subtitle: Text(profile.phoneNumber),
                ),
                ListTile(
                  title: const Text('Blood Group'),
                  subtitle: Text(profile.bloodGroup),
                ),
                ListTile(
                  title: const Text('Address'),
                  subtitle: Text(profile.address),
                ),
                const Spacer(),
                CustomButton(text: 'Edit Profile', onPressed: () {}),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
