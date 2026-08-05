import 'package:freezed_annotation/freezed_annotation.dart';

part 'fire_station_model.freezed.dart';
part 'fire_station_model.g.dart';

@freezed
class FireStation with _$FireStation {
  const factory FireStation({
    required String id,
    required String name,
    required String address,
    required String phone,
    required String locationId,
  }) = _FireStation;

  factory FireStation.fromJson(Map<String, dynamic> json) =>
      _$FireStationFromJson(json);
}
