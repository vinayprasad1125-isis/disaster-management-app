import '../models/offline_ai_models.dart';

/// Defines the contract for the AI Assistant Repository.
/// This interface is designed to support both Offline (TFLite)
/// and potentially Online (API) modes seamlessly without changing the UI.
abstract class OfflineAIRepository {
  /// Initializes the AI Engine.
  /// If [forceOffline] is true, it strictly loads the local TFLite models.
  Future<void> initialize({bool forceOffline = true});

  /// Processes the user's question and returns an AI Response.
  /// Internally, it decides whether to use the offline engine or an online API
  /// based on connectivity and initialization configuration.
  Future<OfflineAnswer> getAnswer(OfflineQuestion query);

  /// Retrieves the history of the conversation.
  Future<ConversationHistory> getConversationHistory(String sessionId);

  /// Clears the current conversation history.
  Future<void> clearHistory(String sessionId);

  /// Checks if the local models are successfully loaded and ready for offline use.
  bool get isOfflineReady;

  /// Disposes of any resources held by the repository.
  Future<void> dispose();
}
