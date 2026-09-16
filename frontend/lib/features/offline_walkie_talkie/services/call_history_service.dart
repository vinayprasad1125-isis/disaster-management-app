import '../repositories/walkie_talkie_repository.dart';
import '../models/communication_session.dart';

class CallHistoryService {
  final WalkieTalkieRepository _repository;

  CallHistoryService(this._repository);

  Future<void> saveSession(CommunicationSession session) async {
    await _repository.saveCallSession(session);
  }

  Future<List<CommunicationSession>> getHistory() async {
    return await _repository.getCallHistory();
  }
}
