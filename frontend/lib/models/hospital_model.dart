import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_model.freezed.dart';
part 'hospital_model.g.dart';

@freezed
class Hospital with _$Hospital {
  const factory Hospital({
    required String id,
    required String name,
    required String address,
    required String phone,
    required String locationId,
  }) = _Hospital;

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);
}
