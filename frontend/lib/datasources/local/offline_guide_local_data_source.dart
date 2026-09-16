import '../../models/offline_guide_model.dart';

abstract class OfflineGuideLocalDataSource {
  Future<List<OfflineGuide>> getOfflineGuides();
  Future<void> saveOfflineGuides(List<OfflineGuide> guides);
  Future<void> clearOfflineGuides();
}
