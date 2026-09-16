import '../models/chat_message_model.dart';

abstract class ChatRepository {
  Future<List<ChatMessage>> getMessages(String channelId);
  Future<void> sendMessage(String channelId, ChatMessage message);
}
