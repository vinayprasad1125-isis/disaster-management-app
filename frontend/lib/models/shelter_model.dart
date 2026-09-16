import 'package:freezed_annotation/freezed_annotation.dart';

part 'shelter_model.freezed.dart';
part 'shelter_model.g.dart';

@freezed
class Shelter with _$Shelter {
  const factory Shelter({
    required String id,
    required String name,
    required String address,
    required int capacity,
    required int availableBeds,
    required String locationId,
  }) = _Shelter;

  factory Shelter.fromJson(Map<String, dynamic> json) =>
      _$ShelterFromJson(json);
}
