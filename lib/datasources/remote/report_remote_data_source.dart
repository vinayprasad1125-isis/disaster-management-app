import '../../models/disaster_report_model.dart';

abstract class ReportRemoteDataSource {
  Future<List<DisasterReport>> getRecentReports(double lat, double lng);
  Future<void> submitReport(DisasterReport report);
}
