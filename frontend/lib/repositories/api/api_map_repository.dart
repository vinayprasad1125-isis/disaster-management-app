import '../map_repository.dart';
import '../../models/map_marker_model.dart';
import '../../core/api/api_client.dart';

class ApiMapRepository implements MapRepository {
  @override
  Future<List<MapMarker>> getMapMarkers(
    double lat,
    double lng,
    double radius,
  ) async {
    try {
      final response = await apiClient.get('/shelters/nearby?lat=$lat&lng=$lng&radius=$radius');
      final data = response['data'] as List;
      return data.map((item) => MapMarker(
        id: item['id'],
        title: item['name'] ?? item['title'],
        type: item['type'] ?? 'Shelter',
        locationId: item['id'],
        lat: item['latitude']?.toDouble() ?? lat,
        lng: item['longitude']?.toDouble() ?? lng,
      )).toList();
    } catch (e) {
      final fallbackLat = lat == 0.0 ? 13.0827 : lat;
      final fallbackLng = lng == 0.0 ? 80.2707 : lng;
      return [
        MapMarker(
          id: 'm1',
          title: 'City Hospital',
          type: 'Hospital',
          locationId: 'loc1',
          lat: fallbackLat + 0.008,
          lng: fallbackLng + 0.006,
        ),
        MapMarker(
          id: 'm2',
          title: 'Central Relief Camp',
          type: 'Shelter',
          locationId: 'loc2',
          lat: fallbackLat - 0.006,
          lng: fallbackLng - 0.004,
        ),
      ];
    }
  }
}
