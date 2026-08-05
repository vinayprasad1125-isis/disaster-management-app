import 'dart:async';
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
    await ref
        .read(emergencyContactRepositoryProvider)
        .addEmergencyContact(contact);
    state = await AsyncValue.guard(
      () => ref.read(emergencyContactRepositoryProvider).getEmergencyContacts(),
    );
  }
}

final emergencyContactViewModelProvider =
    AsyncNotifierProvider<EmergencyContactViewModel, List<EmergencyContact>>(
      () {
        return EmergencyContactViewModel();
      },
    );
