import '../models/route_model.dart';

abstract class RouteRepository {
  Future<Route> getRoute(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  );
}
