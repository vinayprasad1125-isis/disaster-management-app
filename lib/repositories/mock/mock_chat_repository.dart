import '../chat_repository.dart';
import '../../models/chat_message_model.dart';

class MockChatRepository implements ChatRepository {
  @override
  Future<List<ChatMessage>> getMessages(String channelId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      ChatMessage(
        id: 'msg1',
        senderId: 'user1',
        text: 'Has the rescue team arrived?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      ChatMessage(
        id: 'msg2',
        senderId: 'responder1',
        text: 'We are 5 minutes away.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
    ];
  }

  @override
  Future<void> sendMessage(String channelId, ChatMessage message) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
