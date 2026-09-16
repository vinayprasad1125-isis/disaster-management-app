import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteer_model.freezed.dart';
part 'volunteer_model.g.dart';

@freezed
class Volunteer with _$Volunteer {
  const factory Volunteer({
    required String id,
    required String name,
    required List<String> skills,
    required String availability,
    required String locationId,
  }) = _Volunteer;

  factory Volunteer.fromJson(Map<String, dynamic> json) =>
      _$VolunteerFromJson(json);
}
