import '../models/relief_center_model.dart';

abstract class ReliefCenterRepository {
  Future<List<ReliefCenter>> getNearbyReliefCenters(double lat, double lng);
}
