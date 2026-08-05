import '../../models/map_marker_model.dart';

abstract class MapRemoteDataSource {
  Future<List<MapMarker>> getMapMarkers(double lat, double lng, double radius);
}
