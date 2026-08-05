import 'package:freezed_annotation/freezed_annotation.dart';
import 'route_step_model.dart';

part 'route_model.freezed.dart';
part 'route_model.g.dart';

@freezed
class Route with _$Route {
  const factory Route({
    required String distance,
    required String duration,
    required List<RouteStep> steps,
  }) = _Route;

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}
