import 'package:flutter/material.dart';
import '../models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage chat;

  const MessageBubble({
    Key? key,
    required this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          chat.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: chat.isMe
              ? Colors.red
              : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment:
              chat.isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          children: [

            Text(
              chat.sender,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              chat.message,
              style: TextStyle(
                color:
                    chat.isMe
                        ? Colors.white
                        : Colors.black,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              "${chat.time.hour}:${chat.time.minute.toString().padLeft(2, '0')}",
              style: TextStyle(
                fontSize: 10,
                color:
                    chat.isMe
                        ? Colors.white70
                        : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
