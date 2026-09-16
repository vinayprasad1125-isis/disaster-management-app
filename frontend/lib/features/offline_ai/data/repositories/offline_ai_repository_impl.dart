import '../../domain/repositories/offline_ai_repository.dart';
import '../../domain/models/offline_ai_models.dart';
import '../../services/offline_ai_service.dart';
import '../../services/conversation_history_manager.dart';

class OfflineAIRepositoryImpl implements OfflineAIRepository {
  final OfflineAIService _aiService;
  final ConversationHistoryManager _historyManager;
  
  bool _isOfflineReady = false;

  OfflineAIRepositoryImpl({
    required OfflineAIService aiService,
    required ConversationHistoryManager historyManager,
  })  : _aiService = aiService,
        _historyManager = historyManager;

  @override
  Future<void> initialize({bool forceOffline = true}) async {
    try {
      await _aiService.initialize();
      await _historyManager.initialize();
      _isOfflineReady = true;
    } catch (e) {
      _isOfflineReady = false;
      throw Exception('Repository Initialization failed: $e');
    }
  }

  @override
  bool get isOfflineReady => _isOfflineReady;

  @override
  Future<OfflineAnswer> getAnswer(OfflineQuestion query) async {
    if (!_isOfflineReady) {
      // In a Hybrid setup, we might fallback to an API here
      // For strictly offline:
      throw Exception('Offline AI is not initialized or ready.');
    }

    final inferenceResult = await _aiService.processQuery(query);
    
    return OfflineAnswer(
      text: inferenceResult.extractedAnswer,
      confidenceScore: inferenceResult.confidence,
      executionTimeMs: inferenceResult.durationMs,
      timestamp: DateTime.now(),
    );
  }

  @override
  Future<ConversationHistory> getConversationHistory(String sessionId) async {
    final history = await _historyManager.getHistory(sessionId);
    return history ?? ConversationHistory(
      id: sessionId,
      questions: [],
      answers: [],
      lastUpdated: DateTime.now(),
    );
  }

  @override
  Future<void> clearHistory(String sessionId) async {
    await _historyManager.clearHistory(sessionId);
  }

  @override
  Future<void> dispose() async {
    await _aiService.dispose();
  }
}
