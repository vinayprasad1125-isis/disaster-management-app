import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/ai_message_model.dart';
import '../core/providers/repository_providers.dart';

class ChatViewModel extends AsyncNotifier<List<AiMessage>> {
  @override
  FutureOr<List<AiMessage>> build() async {
    return [];
  }

  Future<void> sendMessage(String text) async {
    final prev = state.value ?? [];

    // Optimistic UI update for user message
    final userMsg = AiMessage(
      id: DateTime.now().toString(),
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );
    state = AsyncValue.data([...prev, userMsg]);

    try {
      final aiResponse = await ref.read(aiRepositoryProvider).sendMessage(text);
      state = AsyncValue.data([...state.value!, aiResponse]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final chatViewModelProvider =
    AsyncNotifierProvider<ChatViewModel, List<AiMessage>>(() {
      return ChatViewModel();
    });
