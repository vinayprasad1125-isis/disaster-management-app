import 'package:flutter/material.dart';

import '../models/chat_message.dart';
import '../widgets/message_bubble.dart';

class OfflineChatScreen extends StatefulWidget {
  const OfflineChatScreen({Key? key}) : super(key: key);

  @override
  State<OfflineChatScreen> createState() =>
      _OfflineChatScreenState();
}

class _OfflineChatScreenState
    extends State<OfflineChatScreen> {

  final TextEditingController controller =
      TextEditingController();

  List<ChatMessage> chats = [

    ChatMessage(
      sender: "Nearby Survivor",
      message: "Is everyone safe?",
      time: DateTime.now(),
      isMe: false,
    ),

    ChatMessage(
      sender: "You",
      message: "I'm safe. Need water.",
      time: DateTime.now(),
      isMe: true,
    ),
  ];

  void sendMessage() {

    if (controller.text.isEmpty) return;

    setState(() {

      chats.add(

        ChatMessage(
          sender: "You",
          message: controller.text,
          time: DateTime.now(),
          isMe: true,
        ),

      );

    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("Offline Chat"),

        backgroundColor: Colors.red,

      ),

      body: Column(

        children: [

          Expanded(

            child: ListView.builder(

              itemCount: chats.length,

              itemBuilder: (context, index) {

                return MessageBubble(
                  chat: chats[index],
                );

              },

            ),

          ),

          const Divider(),

          Padding(

            padding: const EdgeInsets.all(10),

            child: Row(

              children: [

                Expanded(

                  child: TextField(

                    controller: controller,

                    decoration: const InputDecoration(

                      hintText:
                          "Send emergency message...",

                      border: OutlineInputBorder(),

                    ),

                  ),

                ),

                const SizedBox(width: 8),

                FloatingActionButton(

                  mini: true,

                  backgroundColor: Colors.red,

                  onPressed: sendMessage,

                  child: const Icon(Icons.send),

                ),

              ],

            ),

          )

        ],

      ),

    );
  }
}
