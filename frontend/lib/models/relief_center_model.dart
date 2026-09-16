import 'package:freezed_annotation/freezed_annotation.dart';

part 'relief_center_model.freezed.dart';
part 'relief_center_model.g.dart';

@freezed
class ReliefCenter with _$ReliefCenter {
  const factory ReliefCenter({
    required String id,
    required String name,
    required List<String> resources,
    required String locationId,
  }) = _ReliefCenter;

  factory ReliefCenter.fromJson(Map<String, dynamic> json) =>
      _$ReliefCenterFromJson(json);
}
