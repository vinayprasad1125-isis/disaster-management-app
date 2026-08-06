import '../route_repository.dart';
import '../../models/route_model.dart';
import '../../models/route_step_model.dart';

class ApiRouteRepository implements RouteRepository {
  @override
  Future<Route> getRoute(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Route(
      distance: '5.2 km',
      duration: '15 mins',
      steps: [
        RouteStep(
          instruction: 'Head north on Main St',
          distance: '1 km',
          duration: '3 mins',
        ),
        RouteStep(
          instruction: 'Turn right at the hospital',
          distance: '4.2 km',
          duration: '12 mins',
        ),
      ],
    );
  }
}
