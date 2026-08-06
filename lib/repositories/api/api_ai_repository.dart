import '../ai_repository.dart';
import '../../models/ai_message_model.dart';
import '../../core/api/api_client.dart';

class ApiAIRepository implements AIRepository {
  @override
  Future<AiMessage> sendMessage(String message) async {
    try {
      final response = await apiClient.post('/ai/chat', {'message': message});
      return AiMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: response['data']['reply'] ?? 'No response',
        isUser: false,
        timestamp: DateTime.now(),
      );
    } catch (e) {
      return AiMessage(
        id: 'err',
        text: 'Sorry, the AI service is currently unreachable.',
        isUser: false,
        timestamp: DateTime.now(),
      );
    }
  }

  @override
  Future<List<AiMessage>> getChatHistory(String sessionId) async {
    return [];
  }
}
