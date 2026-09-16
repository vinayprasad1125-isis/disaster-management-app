import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/emergency_contact_model.dart';
import '../../data/repositories/emergency_contact_repository_impl.dart';
import '../../domain/repositories/emergency_contact_repository.dart';

final emergencyContactsFeatureRepositoryProvider =
    Provider<EmergencyContactRepository>(
  (ref) => ApiEmergencyContactRepository(),
);

class EmergencyContactsProvider
    extends AsyncNotifier<List<EmergencyContact>> {
  @override
  FutureOr<List<EmergencyContact>> build() async {
    return ref
        .read(emergencyContactsFeatureRepositoryProvider)
        .getEmergencyContacts();
  }

  Future<void> addContact(EmergencyContact contact) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(emergencyContactsFeatureRepositoryProvider)
          .addEmergencyContact(contact);
      return ref
          .read(emergencyContactsFeatureRepositoryProvider)
          .getEmergencyContacts();
    });
  }
}

final emergencyContactsProvider = AsyncNotifierProvider<
    EmergencyContactsProvider, List<EmergencyContact>>(
  EmergencyContactsProvider.new,
);
