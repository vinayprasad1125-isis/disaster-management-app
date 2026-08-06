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
      // Fallback
      return [
        MapMarker(
          id: 'm1',
          title: 'City Hospital (API Failed)',
          type: 'Hospital',
          locationId: 'loc1',
          lat: lat,
          lng: lng,
        ),
      ];
    }
  }
}
