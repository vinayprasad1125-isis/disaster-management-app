import 'package:freezed_annotation/freezed_annotation.dart';

part 'police_station_model.freezed.dart';
part 'police_station_model.g.dart';

@freezed
class PoliceStation with _$PoliceStation {
  const factory PoliceStation({
    required String id,
    required String name,
    required String address,
    required String phone,
    required String locationId,
  }) = _PoliceStation;

  factory PoliceStation.fromJson(Map<String, dynamic> json) =>
      _$PoliceStationFromJson(json);
}
