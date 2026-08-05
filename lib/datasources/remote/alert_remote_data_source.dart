import '../../models/alert_model.dart';

abstract class AlertRemoteDataSource {
  Future<List<Alert>> getAlerts(double lat, double lng);
}
