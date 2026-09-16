import 'package:freezed_annotation/freezed_annotation.dart';

part 'disaster_risk_model.freezed.dart';
part 'disaster_risk_model.g.dart';

@freezed
class DisasterRisk with _$DisasterRisk {
  const factory DisasterRisk({
    required String level,
    required String description,
    required List<String> affectedAreas,
  }) = _DisasterRisk;

  factory DisasterRisk.fromJson(Map<String, dynamic> json) =>
      _$DisasterRiskFromJson(json);
}
