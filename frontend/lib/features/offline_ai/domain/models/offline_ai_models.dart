import 'package:freezed_annotation/freezed_annotation.dart';

part 'offline_ai_models.freezed.dart';
part 'offline_ai_models.g.dart';

@JsonEnum(alwaysCreate: true)
enum KnowledgeCategory {
  firstAid,
  flood,
  earthquake,
  cyclone,
  fire,
  landslide,
  medicalEmergencies,
  foodSafety,
  waterSafety,
  shelterInformation,
  unknown
}

@freezed
class OfflineQuestion with _$OfflineQuestion {
  const factory OfflineQuestion({
    required String id,
    required String text,
    required DateTime timestamp,
  }) = _OfflineQuestion;

  factory OfflineQuestion.fromJson(Map<String, dynamic> json) =>
      _$OfflineQuestionFromJson(json);
}

@freezed
class OfflineAnswer with _$OfflineAnswer {
  const factory OfflineAnswer({
    required String text,
    required double confidenceScore,
    required int executionTimeMs,
    required DateTime timestamp,
  }) = _OfflineAnswer;

  factory OfflineAnswer.fromJson(Map<String, dynamic> json) =>
      _$OfflineAnswerFromJson(json);
}

@freezed
class KnowledgeDocument with _$KnowledgeDocument {
  const factory KnowledgeDocument({
    required String id,
    required String title,
    required String content,
    required KnowledgeCategory category,
  }) = _KnowledgeDocument;

  factory KnowledgeDocument.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeDocumentFromJson(json);
}

@freezed
class ConversationHistory with _$ConversationHistory {
  const factory ConversationHistory({
    required String id,
    required List<OfflineQuestion> questions,
    required List<OfflineAnswer> answers,
    required DateTime lastUpdated,
  }) = _ConversationHistory;

  factory ConversationHistory.fromJson(Map<String, dynamic> json) =>
      _$ConversationHistoryFromJson(json);
}

@freezed
class InferenceResult with _$InferenceResult {
  const factory InferenceResult({
    required String extractedAnswer,
    required double confidence,
    required int durationMs,
    required String sourceDocumentId,
    required bool isSuccessful,
    String? errorMessage,
  }) = _InferenceResult;

  factory InferenceResult.fromJson(Map<String, dynamic> json) =>
      _$InferenceResultFromJson(json);
}
