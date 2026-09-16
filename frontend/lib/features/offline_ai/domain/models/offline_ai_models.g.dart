// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_ai_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfflineQuestionImpl _$$OfflineQuestionImplFromJson(
  Map<String, dynamic> json,
) => _$OfflineQuestionImpl(
  id: json['id'] as String,
  text: json['text'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$$OfflineQuestionImplToJson(
  _$OfflineQuestionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'timestamp': instance.timestamp.toIso8601String(),
};

_$OfflineAnswerImpl _$$OfflineAnswerImplFromJson(Map<String, dynamic> json) =>
    _$OfflineAnswerImpl(
      text: json['text'] as String,
      confidenceScore: (json['confidenceScore'] as num).toDouble(),
      executionTimeMs: (json['executionTimeMs'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$OfflineAnswerImplToJson(_$OfflineAnswerImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'confidenceScore': instance.confidenceScore,
      'executionTimeMs': instance.executionTimeMs,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$KnowledgeDocumentImpl _$$KnowledgeDocumentImplFromJson(
  Map<String, dynamic> json,
) => _$KnowledgeDocumentImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  category: $enumDecode(_$KnowledgeCategoryEnumMap, json['category']),
);

Map<String, dynamic> _$$KnowledgeDocumentImplToJson(
  _$KnowledgeDocumentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'category': _$KnowledgeCategoryEnumMap[instance.category]!,
};

const _$KnowledgeCategoryEnumMap = {
  KnowledgeCategory.firstAid: 'firstAid',
  KnowledgeCategory.flood: 'flood',
  KnowledgeCategory.earthquake: 'earthquake',
  KnowledgeCategory.cyclone: 'cyclone',
  KnowledgeCategory.fire: 'fire',
  KnowledgeCategory.landslide: 'landslide',
  KnowledgeCategory.medicalEmergencies: 'medicalEmergencies',
  KnowledgeCategory.foodSafety: 'foodSafety',
  KnowledgeCategory.waterSafety: 'waterSafety',
  KnowledgeCategory.shelterInformation: 'shelterInformation',
  KnowledgeCategory.unknown: 'unknown',
};

_$ConversationHistoryImpl _$$ConversationHistoryImplFromJson(
  Map<String, dynamic> json,
) => _$ConversationHistoryImpl(
  id: json['id'] as String,
  questions: (json['questions'] as List<dynamic>)
      .map((e) => OfflineQuestion.fromJson(e as Map<String, dynamic>))
      .toList(),
  answers: (json['answers'] as List<dynamic>)
      .map((e) => OfflineAnswer.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
);

Map<String, dynamic> _$$ConversationHistoryImplToJson(
  _$ConversationHistoryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'questions': instance.questions,
  'answers': instance.answers,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
};

_$InferenceResultImpl _$$InferenceResultImplFromJson(
  Map<String, dynamic> json,
) => _$InferenceResultImpl(
  extractedAnswer: json['extractedAnswer'] as String,
  confidence: (json['confidence'] as num).toDouble(),
  durationMs: (json['durationMs'] as num).toInt(),
  sourceDocumentId: json['sourceDocumentId'] as String,
  isSuccessful: json['isSuccessful'] as bool,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$$InferenceResultImplToJson(
  _$InferenceResultImpl instance,
) => <String, dynamic>{
  'extractedAnswer': instance.extractedAnswer,
  'confidence': instance.confidence,
  'durationMs': instance.durationMs,
  'sourceDocumentId': instance.sourceDocumentId,
  'isSuccessful': instance.isSuccessful,
  'errorMessage': instance.errorMessage,
};
