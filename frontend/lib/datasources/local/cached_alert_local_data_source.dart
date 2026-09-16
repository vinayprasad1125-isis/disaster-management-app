import '../../models/alert_model.dart';

abstract class CachedAlertLocalDataSource {
  Future<List<Alert>> getCachedAlerts();
  Future<void> saveCachedAlerts(List<Alert> alerts);
  Future<void> clearCachedAlerts();
}
