import '../government_alert_repository.dart';
import '../../models/government_alert_model.dart';

class MockGovernmentAlertRepository implements GovernmentAlertRepository {
  @override
  Future<List<GovernmentAlert>> getGovernmentAlerts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      GovernmentAlert(
        id: 'ga1',
        title: 'Evacuation Order',
        description: 'Mandatory evacuation for coastal areas.',
        source: 'National Disaster Management Authority',
        timestamp: DateTime.now(),
      ),
    ];
  }
}
