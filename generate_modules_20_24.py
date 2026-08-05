import os

dirs_to_create = [
    "lib/viewmodels",
    "lib/features/services/presentation/screens",
    "lib/features/profile/presentation/screens",
    "lib/features/offline/presentation/screens"
]

for d in dirs_to_create:
    os.makedirs(d, exist_ok=True)

files = {
    "lib/viewmodels/relief_center_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/relief_center_model.dart';
import '../core/providers/repository_providers.dart';

class ReliefCenterViewModel extends AsyncNotifier<List<ReliefCenter>> {
  @override
  FutureOr<List<ReliefCenter>> build() async {
    return ref.read(reliefCenterRepositoryProvider).getNearbyReliefCenters(0.0, 0.0);
  }

  Future<void> fetchReliefCenters(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(reliefCenterRepositoryProvider).getNearbyReliefCenters(lat, lng));
  }
}

final reliefCenterViewModelProvider = AsyncNotifierProvider<ReliefCenterViewModel, List<ReliefCenter>>(() {
  return ReliefCenterViewModel();
});
""",
    "lib/viewmodels/volunteer_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/volunteer_model.dart';
import '../core/providers/repository_providers.dart';

class VolunteerViewModel extends AsyncNotifier<List<Volunteer>> {
  @override
  FutureOr<List<Volunteer>> build() async {
    return ref.read(volunteerRepositoryProvider).getNearbyVolunteers(0.0, 0.0);
  }

  Future<void> fetchVolunteers(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(volunteerRepositoryProvider).getNearbyVolunteers(lat, lng));
  }
  
  Future<void> register(Volunteer v) async {
    state = const AsyncValue.loading();
    await ref.read(volunteerRepositoryProvider).registerAsVolunteer(v);
    state = await AsyncValue.guard(() => ref.read(volunteerRepositoryProvider).getNearbyVolunteers(0.0, 0.0));
  }
}

final volunteerViewModelProvider = AsyncNotifierProvider<VolunteerViewModel, List<Volunteer>>(() {
  return VolunteerViewModel();
});
""",
    "lib/viewmodels/emergency_contact_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/emergency_contact_model.dart';
import '../core/providers/repository_providers.dart';

class EmergencyContactViewModel extends AsyncNotifier<List<EmergencyContact>> {
  @override
  FutureOr<List<EmergencyContact>> build() async {
    return ref.read(emergencyContactRepositoryProvider).getEmergencyContacts();
  }

  Future<void> addContact(EmergencyContact contact) async {
    state = const AsyncValue.loading();
    await ref.read(emergencyContactRepositoryProvider).addEmergencyContact(contact);
    state = await AsyncValue.guard(() => ref.read(emergencyContactRepositoryProvider).getEmergencyContacts());
  }
}

final emergencyContactViewModelProvider = AsyncNotifierProvider<EmergencyContactViewModel, List<EmergencyContact>>(() {
  return EmergencyContactViewModel();
});
""",
    "lib/features/services/presentation/screens/relief_center_list_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/relief_center_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';
import 'relief_center_detail_screen.dart';

class ReliefCenterListScreen extends ConsumerWidget {
  const ReliefCenterListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reliefCenterViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Relief Centers')),
      body: state.when(
        data: (centers) {
          if (centers.isEmpty) return const Center(child: Text('No relief centers found.'));
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: centers.length,
            itemBuilder: (context, index) {
              final center = centers[index];
              return CustomCard(
                type: CustomCardType.elevated,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ReliefCenterDetailScreen(center: center))
                ),
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.medical_services)),
                  title: Text(center.name),
                  subtitle: Text(center.resources.join(', ')),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
""",
    "lib/features/services/presentation/screens/relief_center_detail_screen.dart": """import 'package:flutter/material.dart';
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
            Text('Resources Available', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: center.resources.map((r) => Chip(label: Text(r))).toList(),
            ),
            const Spacer(),
            CustomButton(text: 'Get Directions', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
""",
    "lib/features/services/presentation/screens/volunteer_list_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/volunteer_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';
import 'volunteer_signup_screen.dart';

class VolunteerListScreen extends ConsumerWidget {
  const VolunteerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(volunteerViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Volunteers')),
      body: state.when(
        data: (vols) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: vols.length,
            itemBuilder: (context, index) {
              return CustomCard(
                type: CustomCardType.outlined,
                child: ListTile(
                  title: Text(vols[index].name),
                  subtitle: Text(vols[index].skills.join(', ')),
                  trailing: Text(vols[index].availability),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VolunteerSignupScreen())),
        label: const Text('Volunteer Now'),
        icon: const Icon(Icons.handshake),
      ),
    );
  }
}
""",
    "lib/features/services/presentation/screens/volunteer_signup_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/volunteer_viewmodel.dart';
import '../../../../models/volunteer_model.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';

class VolunteerSignupScreen extends ConsumerStatefulWidget {
  const VolunteerSignupScreen({super.key});
  @override
  ConsumerState<VolunteerSignupScreen> createState() => _VolunteerSignupScreenState();
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
                final v = Volunteer(id: 'new_vol', name: _nameController.text, skills: ['First Aid'], availability: 'Weekends', locationId: 'loc1');
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
""",
    "lib/features/services/presentation/screens/emergency_contacts_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/emergency_contact_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';

class EmergencyContactsScreen extends ConsumerWidget {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(emergencyContactViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Contacts')),
      body: state.when(
        data: (contacts) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final c = contacts[index];
              return CustomCard(
                type: CustomCardType.elevated,
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(c.name),
                  subtitle: Text(c.relationship),
                  trailing: IconButton(icon: const Icon(Icons.phone), onPressed: (){}),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
""",
    "lib/features/profile/presentation/screens/profile_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/profile_viewmodel.dart';
import '../../../../shared/widgets/custom_button.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: state.when(
        data: (profile) {
          if (profile == null) return const Center(child: Text('Profile not found'));
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50))),
                const SizedBox(height: 24),
                ListTile(title: const Text('Phone Number'), subtitle: Text(profile.phoneNumber)),
                ListTile(title: const Text('Blood Group'), subtitle: Text(profile.bloodGroup)),
                ListTile(title: const Text('Address'), subtitle: Text(profile.address)),
                const Spacer(),
                CustomButton(text: 'Edit Profile', onPressed: (){}),
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
""",
    "lib/features/profile/presentation/screens/settings_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/settings_viewmodel.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: state.when(
        data: (settings) {
          if (settings == null) return const Center(child: Text('Settings error'));
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Notifications'),
                value: settings.notificationsEnabled,
                onChanged: (v) {},
              ),
              ListTile(
                title: const Text('Language'),
                trailing: Text(settings.language),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
""",
    "lib/features/offline/presentation/screens/offline_guides_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/offline_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';
import 'guide_detail_screen.dart';

class OfflineGuidesScreen extends ConsumerWidget {
  const OfflineGuidesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(offlineViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Offline Guides')),
      body: state.when(
        data: (guides) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: guides.length,
            itemBuilder: (context, index) {
              final g = guides[index];
              return CustomCard(
                type: CustomCardType.elevated,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => GuideDetailScreen(guide: g))),
                child: ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(g.title),
                  subtitle: Text(g.category),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
""",
    "lib/features/offline/presentation/screens/guide_detail_screen.dart": """import 'package:flutter/material.dart';
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
            Text(guide.title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Text(guide.content, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
"""
}

for filepath, content in files.items():
    with open(filepath, "w") as f:
        f.write(content)
