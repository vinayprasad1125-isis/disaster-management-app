import '../../models/disaster_report_model.dart';

abstract class RecentReportsLocalDataSource {
  Future<List<DisasterReport>> getRecentReports();
  Future<void> saveRecentReports(List<DisasterReport> reports);
  Future<void> addRecentReport(DisasterReport report);
  Future<void> clearRecentReports();
}
