import '../models/alert_model.dart';

abstract class AlertRepository {
  Future<List<Alert>> getAlerts(double lat, double lng);
}
