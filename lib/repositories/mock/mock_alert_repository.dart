import '../alert_repository.dart';
import '../../models/alert_model.dart';

class MockAlertRepository implements AlertRepository {
  @override
  Future<List<Alert>> getAlerts(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Alert(
        id: 'a1',
        title: 'Flood Warning',
        description: 'Severe flooding expected in low-lying areas.',
        severity: 'High',
        timestamp: DateTime.now(),
      ),
      Alert(
        id: 'a2',
        title: 'Heavy Rainfall',
        description: 'Continuous rain expected for the next 48 hours.',
        severity: 'Medium',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ];
  }
}
