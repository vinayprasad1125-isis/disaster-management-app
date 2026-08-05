import '../../models/route_model.dart';

abstract class RouteRemoteDataSource {
  Future<Route> getRoute(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  );
}
