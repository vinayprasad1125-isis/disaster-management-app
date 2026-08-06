import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/offline_ai_repository.dart';
import '../../data/repositories/offline_ai_repository_impl.dart';
import '../../services/offline_ai_service.dart';
import '../../services/conversation_history_manager.dart';
import '../../services/model_loader.dart';
import '../../services/inference_engine.dart';
import '../../services/tokenizer.dart';
import '../../services/offline_knowledge_base.dart';
import '../../services/answer_extractor.dart';

final modelLoaderProvider = Provider<ModelLoader>((ref) {
  final loader = ModelLoader();
  ref.onDispose(() => loader.dispose());
  return loader;
});

final inferenceEngineProvider = Provider<InferenceEngine>((ref) {
  final engine = InferenceEngine();
  ref.onDispose(() => engine.dispose());
  return engine;
});

final tokenizerProvider = Provider<Tokenizer>((ref) => Tokenizer());
final answerExtractorProvider = Provider<AnswerExtractor>((ref) => AnswerExtractor());
final knowledgeBaseProvider = Provider<OfflineKnowledgeBase>((ref) => OfflineKnowledgeBase());
final conversationHistoryManagerProvider = Provider<ConversationHistoryManager>((ref) => ConversationHistoryManager());

final offlineAiServiceProvider = Provider<OfflineAIService>((ref) {
  final service = OfflineAIServiceImpl(
    modelLoader: ref.watch(modelLoaderProvider),
    inferenceEngine: ref.watch(inferenceEngineProvider),
    tokenizer: ref.watch(tokenizerProvider),
    knowledgeBase: ref.watch(knowledgeBaseProvider),
    answerExtractor: ref.watch(answerExtractorProvider),
  );
  
  ref.onDispose(() => service.dispose());
  return service;
});

final offlineAiRepositoryProvider = Provider<OfflineAIRepository>((ref) {
  return OfflineAIRepositoryImpl(
    aiService: ref.watch(offlineAiServiceProvider),
    historyManager: ref.watch(conversationHistoryManagerProvider),
  );
});
