import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models/offline_ai_models.dart';
import '../providers/offline_ai_provider.dart';

class OfflineAIChatScreen extends ConsumerStatefulWidget {
  const OfflineAIChatScreen({super.key});

  @override
  ConsumerState<OfflineAIChatScreen> createState() => _OfflineAIChatScreenState();
}

class _OfflineAIChatScreenState extends ConsumerState<OfflineAIChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final String _sessionId = const Uuid().v4();

  List<dynamic> _messages = []; // Can hold OfflineQuestion and OfflineAnswer
  bool _isInitializing = true;
  bool _isThinking = false;
  String _initError = '';

  final List<String> _suggestedQuestions = [
    'How do I stop bleeding?',
    'How do I treat burns?',
    'What should I do during an earthquake?',
    'How do I purify drinking water?',
    'What should I pack in an emergency kit?',
  ];

  @override
  void initState() {
    super.initState();
    _initAI();
  }

  Future<void> _initAI() async {
    try {
      final repository = ref.read(offlineAiRepositoryProvider);
      await repository.initialize(forceOffline: true);
      
      // Load history
      final history = await repository.getConversationHistory(_sessionId);
      
      setState(() {
        _isInitializing = false;
        // Merge history for UI (mock merging logic for demo)
        if (history.questions.isNotEmpty) {
          for (int i = 0; i < history.questions.length; i++) {
            _messages.add(history.questions[i]);
            if (i < history.answers.length) {
              _messages.add(history.answers[i]);
            }
          }
        }
      });
    } catch (e) {
      setState(() {
        _isInitializing = false;
        _initError = 'Failed to initialize AI: $e';
      });
    }
  }

  Future<void> _sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final question = OfflineQuestion(
      id: const Uuid().v4(),
      text: text.trim(),
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(question);
      _isThinking = true;
      _textController.clear();
    });
    
    _scrollToBottom();

    try {
      final repository = ref.read(offlineAiRepositoryProvider);
      final answer = await repository.getAnswer(question);
      
      setState(() {
        _messages.add(answer);
        _isThinking = false;
      });
      _scrollToBottom();

      // Save to history (fire and forget)
      // _saveHistory(question, answer);
    } catch (e) {
      setState(() {
        _messages.add(OfflineAnswer(
          text: 'Error: ${e.toString()}',
          confidenceScore: 0.0,
          executionTimeMs: 0,
          timestamp: DateTime.now(),
        ));
        _isThinking = false;
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _clearChat() {
    setState(() {
      _messages.clear();
    });
    ref.read(offlineAiRepositoryProvider).clearHistory(_sessionId);
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline AI Assistant'),
        actions: [
          if (!_isInitializing && _initError.isEmpty)
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.offline_bolt, color: Colors.green, size: 16),
                    SizedBox(width: 4),
                    Text('Offline Ready', style: TextStyle(color: Colors.green, fontSize: 12)),
                  ],
                ),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: _clearChat,
            tooltip: 'Clear Chat',
          )
        ],
      ),
      body: Column(
        children: [
          if (_isInitializing)
            const Expanded(child: Center(child: CircularProgressIndicator()))
          else if (_initError.isNotEmpty)
            Expanded(child: Center(child: Text(_initError, style: const TextStyle(color: Colors.red))))
          else
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length + (_isThinking ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == _messages.length && _isThinking) {
                    return _buildTypingIndicator();
                  }

                  final msg = _messages[index];
                  if (msg is OfflineQuestion) {
                    return _buildUserBubble(msg.text, theme);
                  } else if (msg is OfflineAnswer) {
                    return _buildAiBubble(msg, theme);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),

          // Suggested Questions
          if (_messages.isEmpty && !_isInitializing && _initError.isEmpty)
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _suggestedQuestions.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ActionChip(
                      label: Text(_suggestedQuestions[index]),
                      onPressed: () => _sendMessage(_suggestedQuestions[index]),
                    ),
                  );
                },
              ),
            ),
          
          const Divider(height: 1),
          // Input Area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: theme.colorScheme.surface,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Ask an emergency question...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  backgroundColor: theme.colorScheme.primary,
                  child: IconButton(
                    icon: Icon(Icons.send, color: theme.colorScheme.onPrimary),
                    onPressed: () => _sendMessage(_textController.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserBubble(String text, ThemeData theme) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, left: 40),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Text(text, style: TextStyle(color: theme.colorScheme.onPrimary)),
      ),
    );
  }

  Widget _buildAiBubble(OfflineAnswer answer, ThemeData theme) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, right: 40),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(answer.text, style: TextStyle(color: theme.colorScheme.onSurface)),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.speed, size: 12, color: theme.colorScheme.outline),
                const SizedBox(width: 4),
                Text('${answer.executionTimeMs}ms', style: TextStyle(fontSize: 10, color: theme.colorScheme.outline)),
                const SizedBox(width: 12),
                Icon(Icons.analytics, size: 12, color: theme.colorScheme.outline),
                const SizedBox(width: 4),
                Text('${(answer.confidenceScore * 100).toStringAsFixed(1)}% confidence', style: TextStyle(fontSize: 10, color: theme.colorScheme.outline)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 12, height: 12, child: CircularProgressIndicator(strokeWidth: 2)),
            SizedBox(width: 12),
            Text('Analyzing manuals offline...'),
          ],
        ),
      ),
    );
  }
}
