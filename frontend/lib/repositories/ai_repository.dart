import '../models/ai_message_model.dart';

abstract class AIRepository {
  Future<AiMessage> sendMessage(String message);
  Future<List<AiMessage>> getChatHistory(String sessionId);
}
