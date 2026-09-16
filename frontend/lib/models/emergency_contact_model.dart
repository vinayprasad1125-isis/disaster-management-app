import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_contact_model.freezed.dart';
part 'emergency_contact_model.g.dart';

@freezed
class EmergencyContact with _$EmergencyContact {
  const factory EmergencyContact({
    required String id,
    required String name,
    required String phone,
    required String relationship,
  }) = _EmergencyContact;

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);
}
