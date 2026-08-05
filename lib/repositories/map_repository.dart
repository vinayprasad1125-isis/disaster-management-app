import '../models/map_marker_model.dart';

abstract class MapRepository {
  Future<List<MapMarker>> getMapMarkers(double lat, double lng, double radius);
}
