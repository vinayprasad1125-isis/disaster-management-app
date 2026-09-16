import '../relief_center_repository.dart';
import '../../models/relief_center_model.dart';

class ApiReliefCenterRepository implements ReliefCenterRepository {
  @override
  Future<List<ReliefCenter>> getNearbyReliefCenters(
    double lat,
    double lng,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      ReliefCenter(
        id: 'rc1',
        name: 'Downtown Relief',
        resources: ['Food', 'Water', 'Medical'],
        locationId: 'loc1',
      ),
      ReliefCenter(
        id: 'rc2',
        name: 'Westside Camp',
        resources: ['Clothing', 'Water'],
        locationId: 'loc2',
      ),
    ];
  }
}
