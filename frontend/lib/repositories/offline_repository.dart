import '../models/offline_guide_model.dart';

abstract class OfflineRepository {
  Future<List<OfflineGuide>> getOfflineGuides();
  Future<void> saveOfflineGuides(List<OfflineGuide> guides);
  Future<bool> isOfflineReady();
}
