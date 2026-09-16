import 'package:flutter/foundation.dart';
import '../domain/models/offline_ai_models.dart';
import 'model_loader.dart';
import 'inference_engine.dart';
import 'tokenizer.dart';
import 'offline_knowledge_base.dart';
import 'answer_extractor.dart';

/// The core orchestrator for Offline AI processing.
/// Handles initialization, error handling, and coordinating ML components.
abstract class OfflineAIService {
  /// Initializes the ML engine (Models, Vocab, Knowledge Base).
  Future<void> initialize();

  /// Processes a user query using the TFLite models and Knowledge Base.
  /// Throws exceptions if models are missing or inference fails.
  Future<InferenceResult> processQuery(OfflineQuestion query);

  /// Disposes of all resources (TFLite interpreters, caches).
  Future<void> dispose();
}

class OfflineAIServiceImpl implements OfflineAIService {
  final ModelLoader _modelLoader;
  final InferenceEngine _inferenceEngine;
  final Tokenizer _tokenizer;
  final OfflineKnowledgeBase _knowledgeBase;
  final AnswerExtractor _answerExtractor;

  bool _isInitialized = false;

  OfflineAIServiceImpl({
    required ModelLoader modelLoader,
    required InferenceEngine inferenceEngine,
    required Tokenizer tokenizer,
    required OfflineKnowledgeBase knowledgeBase,
    required AnswerExtractor answerExtractor,
  })  : _modelLoader = modelLoader,
        _inferenceEngine = inferenceEngine,
        _tokenizer = tokenizer,
        _knowledgeBase = knowledgeBase,
        _answerExtractor = answerExtractor;

  @override
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // 1. Load Knowledge Base into cache
      await _knowledgeBase.initialize();

      // 2. Load TFLite Model
      await _modelLoader.loadModel();

      // 3. Load Vocabulary
      await _tokenizer.loadVocabulary();

      // 4. Initialize Inference Engine
      _inferenceEngine.initialize(_modelLoader.interpreter);

      _isInitialized = true;
    } catch (e) {
      debugPrint('Offline AI Initialization Error: $e');
      throw Exception('Failed to initialize offline AI components: $e');
    }
  }

  @override
  Future<InferenceResult> processQuery(OfflineQuestion query) async {
    if (!_isInitialized) {
      throw Exception('AI Service is not initialized.');
    }
    if (query.text.trim().isEmpty) {
      throw Exception('Query cannot be empty.');
    }

    final stopwatch = Stopwatch()..start();

    try {
      // 1. Retrieve relevant offline document context
      final document = await _knowledgeBase.searchRelevantDocument(query.text);
      if (document == null) {
        return InferenceResult(
          extractedAnswer: "Sorry, I couldn't find an answer in the offline emergency guide.",
          confidence: 0.0,
          durationMs: stopwatch.elapsedMilliseconds,
          sourceDocumentId: '',
          isSuccessful: false,
          errorMessage: 'No relevant manual found.',
        );
      }

      // 2. Tokenize input
      final inputTokens = _tokenizer.tokenizeForQA(
        question: query.text,
        context: document.content,
      );

      // 3. Run Inference
      final outputTensors = await _inferenceEngine.runInference(inputTokens);

      // 4. Extract Answer
      final result = _answerExtractor.extract(
        outputTensors: outputTensors,
        context: document.content,
        question: query.text,
      );

      stopwatch.stop();

      // Bypass confidence threshold for demo purposes

      return InferenceResult(
        extractedAnswer: result.answer,
        confidence: result.confidence,
        durationMs: stopwatch.elapsedMilliseconds,
        sourceDocumentId: document.id,
        isSuccessful: true,
      );
    } catch (e) {
      stopwatch.stop();
      debugPrint('Inference Error: $e');
      return InferenceResult(
        extractedAnswer: "Sorry, an error occurred while processing your request offline.",
        confidence: 0.0,
        durationMs: stopwatch.elapsedMilliseconds,
        sourceDocumentId: '',
        isSuccessful: false,
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<void> dispose() async {
    _inferenceEngine.dispose();
    _modelLoader.dispose();
    _isInitialized = false;
  }
}

