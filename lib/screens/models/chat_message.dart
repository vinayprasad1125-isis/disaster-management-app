class ChatMessage {
  final String sender;
  final String message;
  final DateTime time;
  final bool isMe;

  ChatMessage({
    required this.sender,
    required this.message,
    required this.time,
    required this.isMe,
  });
}
