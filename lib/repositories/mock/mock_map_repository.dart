import '../map_repository.dart';
import '../../models/map_marker_model.dart';

class MockMapRepository implements MapRepository {
  @override
  Future<List<MapMarker>> getMapMarkers(
    double lat,
    double lng,
    double radius,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      MapMarker(
        id: 'm1',
        title: 'City Hospital',
        type: 'Hospital',
        locationId: 'loc1',
      ),
      MapMarker(
        id: 'm2',
        title: 'Central Relief Camp',
        type: 'Shelter',
        locationId: 'loc2',
      ),
    ];
  }
}
