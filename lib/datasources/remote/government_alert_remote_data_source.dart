import '../../models/government_alert_model.dart';

abstract class GovernmentAlertRemoteDataSource {
  Future<List<GovernmentAlert>> getGovernmentAlerts();
}
