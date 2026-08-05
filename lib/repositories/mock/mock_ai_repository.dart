import '../ai_repository.dart';
import '../../models/ai_message_model.dart';

class MockAIRepository implements AIRepository {
  @override
  Future<AiMessage> sendMessage(String message) async {
    await Future.delayed(const Duration(seconds: 1));
    return AiMessage(
      id: 'ai_msg1',
      text:
          'I am here to help you. Based on your current location, the nearest shelter is 2km away.',
      isUser: false,
      timestamp: DateTime.now(),
    );
  }

  @override
  Future<List<AiMessage>> getChatHistory(String sessionId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      AiMessage(
        id: 'usr_msg1',
        text: 'What should I do during a flood?',
        isUser: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      AiMessage(
        id: 'ai_msg2',
        text:
            'Move to higher ground immediately and avoid walking through floodwaters.',
        isUser: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      ),
    ];
  }
}
