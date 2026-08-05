import '../report_repository.dart';
import '../../models/disaster_report_model.dart';

class MockReportRepository implements ReportRepository {
  @override
  Future<List<DisasterReport>> getRecentReports(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      DisasterReport(
        id: 'r1',
        type: 'Flood',
        description: 'Roads blocked due to heavy water logging.',
        severity: 'High',
        locationId: 'loc1',
        timestamp: DateTime.now(),
      ),
      DisasterReport(
        id: 'r2',
        type: 'Fallen Tree',
        description: 'Tree blocking the main highway.',
        severity: 'Medium',
        locationId: 'loc2',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      ),
    ];
  }

  @override
  Future<void> submitReport(DisasterReport report) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
