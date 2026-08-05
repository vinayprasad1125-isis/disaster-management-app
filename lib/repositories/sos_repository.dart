import '../models/sos_model.dart';

abstract class SOSRepository {
  Future<Sos> triggerSOS(Sos sosData);
  Future<void> cancelSOS(String sosId);
  Future<Sos> getSOSStatus(String sosId);
}
