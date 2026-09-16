import '../emergency_contact_repository.dart';
import '../../models/emergency_contact_model.dart';

class MockEmergencyContactRepository implements EmergencyContactRepository {
  @override
  Future<List<EmergencyContact>> getEmergencyContacts() async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      EmergencyContact(
        id: 'ec1',
        name: 'Mom',
        phone: '+1234567890',
        relationship: 'Family',
      ),
      EmergencyContact(
        id: 'ec2',
        name: 'Local Police',
        phone: '911',
        relationship: 'Authority',
      ),
    ];
  }

  @override
  Future<void> addEmergencyContact(EmergencyContact contact) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> removeEmergencyContact(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
