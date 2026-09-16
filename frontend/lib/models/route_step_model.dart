import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_step_model.freezed.dart';
part 'route_step_model.g.dart';

@freezed
class RouteStep with _$RouteStep {
  const factory RouteStep({
    required String instruction,
    required String distance,
    required String duration,
  }) = _RouteStep;

  factory RouteStep.fromJson(Map<String, dynamic> json) =>
      _$RouteStepFromJson(json);
}
