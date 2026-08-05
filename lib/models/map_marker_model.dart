import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_marker_model.freezed.dart';
part 'map_marker_model.g.dart';

@freezed
class MapMarker with _$MapMarker {
  const factory MapMarker({
    required String id,
    required String title,
    required String type,
    required String locationId,
  }) = _MapMarker;

  factory MapMarker.fromJson(Map<String, dynamic> json) =>
      _$MapMarkerFromJson(json);
}
