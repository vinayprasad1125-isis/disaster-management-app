import '../models/emergency_contact_model.dart';

abstract class EmergencyContactRepository {
  Future<List<EmergencyContact>> getEmergencyContacts();
  Future<void> addEmergencyContact(EmergencyContact contact);
  Future<void> removeEmergencyContact(String id);
}
