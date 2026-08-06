import '../models/emergency_message.dart';
import '../models/communication_session.dart';

/// Abstract class representing local storage for offline chats and call history
abstract class CommunicationLocalDataSource {
  Future<void> saveMessage(EmergencyMessage message);
  Future<List<EmergencyMessage>> getChatHistory(String peerId);
  Future<void> saveCallSession(CommunicationSession session);
  Future<List<CommunicationSession>> getCallHistory();
}
