import '../../models/emergency_contact_model.dart';

abstract class EmergencyContactLocalDataSource {
  Future<List<EmergencyContact>> getEmergencyContacts();
  Future<void> saveEmergencyContacts(List<EmergencyContact> contacts);
  Future<void> addEmergencyContact(EmergencyContact contact);
  Future<void> removeEmergencyContact(String id);
}
