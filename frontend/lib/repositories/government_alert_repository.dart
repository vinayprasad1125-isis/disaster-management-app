import '../models/government_alert_model.dart';

abstract class GovernmentAlertRepository {
  Future<List<GovernmentAlert>> getGovernmentAlerts();
}
