import '../sos_repository.dart';
import '../../models/sos_model.dart';

class ApiSOSRepository implements SOSRepository {
  @override
  Future<Sos> triggerSOS(Sos sosData) async {
    await Future.delayed(const Duration(seconds: 1));
    return sosData.copyWith(
      id: 'sos_123',
      status: 'Active',
      timestamp: DateTime.now(),
    );
  }

  @override
  Future<void> cancelSOS(String sosId) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<Sos> getSOSStatus(String sosId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Sos(
      id: sosId,
      userId: 'u1',
      locationId: 'loc1',
      timestamp: DateTime.now(),
      status: 'Responders Dispatched',
    );
  }
}
