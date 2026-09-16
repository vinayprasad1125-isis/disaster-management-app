// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_ai_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OfflineQuestion _$OfflineQuestionFromJson(Map<String, dynamic> json) {
  return _OfflineQuestion.fromJson(json);
}

/// @nodoc
mixin _$OfflineQuestion {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this OfflineQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfflineQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfflineQuestionCopyWith<OfflineQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineQuestionCopyWith<$Res> {
  factory $OfflineQuestionCopyWith(
    OfflineQuestion value,
    $Res Function(OfflineQuestion) then,
  ) = _$OfflineQuestionCopyWithImpl<$Res, OfflineQuestion>;
  @useResult
  $Res call({String id, String text, DateTime timestamp});
}

/// @nodoc
class _$OfflineQuestionCopyWithImpl<$Res, $Val extends OfflineQuestion>
    implements $OfflineQuestionCopyWith<$Res> {
  _$OfflineQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfflineQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OfflineQuestionImplCopyWith<$Res>
    implements $OfflineQuestionCopyWith<$Res> {
  factory _$$OfflineQuestionImplCopyWith(
    _$OfflineQuestionImpl value,
    $Res Function(_$OfflineQuestionImpl) then,
  ) = __$$OfflineQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String text, DateTime timestamp});
}

/// @nodoc
class __$$OfflineQuestionImplCopyWithImpl<$Res>
    extends _$OfflineQuestionCopyWithImpl<$Res, _$OfflineQuestionImpl>
    implements _$$OfflineQuestionImplCopyWith<$Res> {
  __$$OfflineQuestionImplCopyWithImpl(
    _$OfflineQuestionImpl _value,
    $Res Function(_$OfflineQuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OfflineQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$OfflineQuestionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OfflineQuestionImpl implements _OfflineQuestion {
  const _$OfflineQuestionImpl({
    required this.id,
    required this.text,
    required this.timestamp,
  });

  factory _$OfflineQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfflineQuestionImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'OfflineQuestion(id: $id, text: $text, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, timestamp);

  /// Create a copy of OfflineQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfflineQuestionImplCopyWith<_$OfflineQuestionImpl> get copyWith =>
      __$$OfflineQuestionImplCopyWithImpl<_$OfflineQuestionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OfflineQuestionImplToJson(this);
  }
}

abstract class _OfflineQuestion implements OfflineQuestion {
  const factory _OfflineQuestion({
    required final String id,
    required final String text,
    required final DateTime timestamp,
  }) = _$OfflineQuestionImpl;

  factory _OfflineQuestion.fromJson(Map<String, dynamic> json) =
      _$OfflineQuestionImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  DateTime get timestamp;

  /// Create a copy of OfflineQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfflineQuestionImplCopyWith<_$OfflineQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfflineAnswer _$OfflineAnswerFromJson(Map<String, dynamic> json) {
  return _OfflineAnswer.fromJson(json);
}

/// @nodoc
mixin _$OfflineAnswer {
  String get text => throw _privateConstructorUsedError;
  double get confidenceScore => throw _privateConstructorUsedError;
  int get executionTimeMs => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this OfflineAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfflineAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfflineAnswerCopyWith<OfflineAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineAnswerCopyWith<$Res> {
  factory $OfflineAnswerCopyWith(
    OfflineAnswer value,
    $Res Function(OfflineAnswer) then,
  ) = _$OfflineAnswerCopyWithImpl<$Res, OfflineAnswer>;
  @useResult
  $Res call({
    String text,
    double confidenceScore,
    int executionTimeMs,
    DateTime timestamp,
  });
}

/// @nodoc
class _$OfflineAnswerCopyWithImpl<$Res, $Val extends OfflineAnswer>
    implements $OfflineAnswerCopyWith<$Res> {
  _$OfflineAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfflineAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? confidenceScore = null,
    Object? executionTimeMs = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            confidenceScore: null == confidenceScore
                ? _value.confidenceScore
                : confidenceScore // ignore: cast_nullable_to_non_nullable
                      as double,
            executionTimeMs: null == executionTimeMs
                ? _value.executionTimeMs
                : executionTimeMs // ignore: cast_nullable_to_non_nullable
                      as int,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OfflineAnswerImplCopyWith<$Res>
    implements $OfflineAnswerCopyWith<$Res> {
  factory _$$OfflineAnswerImplCopyWith(
    _$OfflineAnswerImpl value,
    $Res Function(_$OfflineAnswerImpl) then,
  ) = __$$OfflineAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String text,
    double confidenceScore,
    int executionTimeMs,
    DateTime timestamp,
  });
}

/// @nodoc
class __$$OfflineAnswerImplCopyWithImpl<$Res>
    extends _$OfflineAnswerCopyWithImpl<$Res, _$OfflineAnswerImpl>
    implements _$$OfflineAnswerImplCopyWith<$Res> {
  __$$OfflineAnswerImplCopyWithImpl(
    _$OfflineAnswerImpl _value,
    $Res Function(_$OfflineAnswerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OfflineAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? confidenceScore = null,
    Object? executionTimeMs = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$OfflineAnswerImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        confidenceScore: null == confidenceScore
            ? _value.confidenceScore
            : confidenceScore // ignore: cast_nullable_to_non_nullable
                  as double,
        executionTimeMs: null == executionTimeMs
            ? _value.executionTimeMs
            : executionTimeMs // ignore: cast_nullable_to_non_nullable
                  as int,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OfflineAnswerImpl implements _OfflineAnswer {
  const _$OfflineAnswerImpl({
    required this.text,
    required this.confidenceScore,
    required this.executionTimeMs,
    required this.timestamp,
  });

  factory _$OfflineAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfflineAnswerImplFromJson(json);

  @override
  final String text;
  @override
  final double confidenceScore;
  @override
  final int executionTimeMs;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'OfflineAnswer(text: $text, confidenceScore: $confidenceScore, executionTimeMs: $executionTimeMs, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineAnswerImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            (identical(other.executionTimeMs, executionTimeMs) ||
                other.executionTimeMs == executionTimeMs) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    text,
    confidenceScore,
    executionTimeMs,
    timestamp,
  );

  /// Create a copy of OfflineAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfflineAnswerImplCopyWith<_$OfflineAnswerImpl> get copyWith =>
      __$$OfflineAnswerImplCopyWithImpl<_$OfflineAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfflineAnswerImplToJson(this);
  }
}

abstract class _OfflineAnswer implements OfflineAnswer {
  const factory _OfflineAnswer({
    required final String text,
    required final double confidenceScore,
    required final int executionTimeMs,
    required final DateTime timestamp,
  }) = _$OfflineAnswerImpl;

  factory _OfflineAnswer.fromJson(Map<String, dynamic> json) =
      _$OfflineAnswerImpl.fromJson;

  @override
  String get text;
  @override
  double get confidenceScore;
  @override
  int get executionTimeMs;
  @override
  DateTime get timestamp;

  /// Create a copy of OfflineAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfflineAnswerImplCopyWith<_$OfflineAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KnowledgeDocument _$KnowledgeDocumentFromJson(Map<String, dynamic> json) {
  return _KnowledgeDocument.fromJson(json);
}

/// @nodoc
mixin _$KnowledgeDocument {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  KnowledgeCategory get category => throw _privateConstructorUsedError;

  /// Serializes this KnowledgeDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KnowledgeDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KnowledgeDocumentCopyWith<KnowledgeDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KnowledgeDocumentCopyWith<$Res> {
  factory $KnowledgeDocumentCopyWith(
    KnowledgeDocument value,
    $Res Function(KnowledgeDocument) then,
  ) = _$KnowledgeDocumentCopyWithImpl<$Res, KnowledgeDocument>;
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    KnowledgeCategory category,
  });
}

/// @nodoc
class _$KnowledgeDocumentCopyWithImpl<$Res, $Val extends KnowledgeDocument>
    implements $KnowledgeDocumentCopyWith<$Res> {
  _$KnowledgeDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KnowledgeDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? category = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as KnowledgeCategory,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KnowledgeDocumentImplCopyWith<$Res>
    implements $KnowledgeDocumentCopyWith<$Res> {
  factory _$$KnowledgeDocumentImplCopyWith(
    _$KnowledgeDocumentImpl value,
    $Res Function(_$KnowledgeDocumentImpl) then,
  ) = __$$KnowledgeDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    KnowledgeCategory category,
  });
}

/// @nodoc
class __$$KnowledgeDocumentImplCopyWithImpl<$Res>
    extends _$KnowledgeDocumentCopyWithImpl<$Res, _$KnowledgeDocumentImpl>
    implements _$$KnowledgeDocumentImplCopyWith<$Res> {
  __$$KnowledgeDocumentImplCopyWithImpl(
    _$KnowledgeDocumentImpl _value,
    $Res Function(_$KnowledgeDocumentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KnowledgeDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? category = null,
  }) {
    return _then(
      _$KnowledgeDocumentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as KnowledgeCategory,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KnowledgeDocumentImpl implements _KnowledgeDocument {
  const _$KnowledgeDocumentImpl({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
  });

  factory _$KnowledgeDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$KnowledgeDocumentImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final KnowledgeCategory category;

  @override
  String toString() {
    return 'KnowledgeDocument(id: $id, title: $title, content: $content, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KnowledgeDocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content, category);

  /// Create a copy of KnowledgeDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KnowledgeDocumentImplCopyWith<_$KnowledgeDocumentImpl> get copyWith =>
      __$$KnowledgeDocumentImplCopyWithImpl<_$KnowledgeDocumentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$KnowledgeDocumentImplToJson(this);
  }
}

abstract class _KnowledgeDocument implements KnowledgeDocument {
  const factory _KnowledgeDocument({
    required final String id,
    required final String title,
    required final String content,
    required final KnowledgeCategory category,
  }) = _$KnowledgeDocumentImpl;

  factory _KnowledgeDocument.fromJson(Map<String, dynamic> json) =
      _$KnowledgeDocumentImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  KnowledgeCategory get category;

  /// Create a copy of KnowledgeDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KnowledgeDocumentImplCopyWith<_$KnowledgeDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConversationHistory _$ConversationHistoryFromJson(Map<String, dynamic> json) {
  return _ConversationHistory.fromJson(json);
}

/// @nodoc
mixin _$ConversationHistory {
  String get id => throw _privateConstructorUsedError;
  List<OfflineQuestion> get questions => throw _privateConstructorUsedError;
  List<OfflineAnswer> get answers => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this ConversationHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversationHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationHistoryCopyWith<ConversationHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationHistoryCopyWith<$Res> {
  factory $ConversationHistoryCopyWith(
    ConversationHistory value,
    $Res Function(ConversationHistory) then,
  ) = _$ConversationHistoryCopyWithImpl<$Res, ConversationHistory>;
  @useResult
  $Res call({
    String id,
    List<OfflineQuestion> questions,
    List<OfflineAnswer> answers,
    DateTime lastUpdated,
  });
}

/// @nodoc
class _$ConversationHistoryCopyWithImpl<$Res, $Val extends ConversationHistory>
    implements $ConversationHistoryCopyWith<$Res> {
  _$ConversationHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversationHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questions = null,
    Object? answers = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            questions: null == questions
                ? _value.questions
                : questions // ignore: cast_nullable_to_non_nullable
                      as List<OfflineQuestion>,
            answers: null == answers
                ? _value.answers
                : answers // ignore: cast_nullable_to_non_nullable
                      as List<OfflineAnswer>,
            lastUpdated: null == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConversationHistoryImplCopyWith<$Res>
    implements $ConversationHistoryCopyWith<$Res> {
  factory _$$ConversationHistoryImplCopyWith(
    _$ConversationHistoryImpl value,
    $Res Function(_$ConversationHistoryImpl) then,
  ) = __$$ConversationHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    List<OfflineQuestion> questions,
    List<OfflineAnswer> answers,
    DateTime lastUpdated,
  });
}

/// @nodoc
class __$$ConversationHistoryImplCopyWithImpl<$Res>
    extends _$ConversationHistoryCopyWithImpl<$Res, _$ConversationHistoryImpl>
    implements _$$ConversationHistoryImplCopyWith<$Res> {
  __$$ConversationHistoryImplCopyWithImpl(
    _$ConversationHistoryImpl _value,
    $Res Function(_$ConversationHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConversationHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questions = null,
    Object? answers = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _$ConversationHistoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        questions: null == questions
            ? _value._questions
            : questions // ignore: cast_nullable_to_non_nullable
                  as List<OfflineQuestion>,
        answers: null == answers
            ? _value._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as List<OfflineAnswer>,
        lastUpdated: null == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationHistoryImpl implements _ConversationHistory {
  const _$ConversationHistoryImpl({
    required this.id,
    required final List<OfflineQuestion> questions,
    required final List<OfflineAnswer> answers,
    required this.lastUpdated,
  }) : _questions = questions,
       _answers = answers;

  factory _$ConversationHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationHistoryImplFromJson(json);

  @override
  final String id;
  final List<OfflineQuestion> _questions;
  @override
  List<OfflineQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final List<OfflineAnswer> _answers;
  @override
  List<OfflineAnswer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'ConversationHistory(id: $id, questions: $questions, answers: $answers, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_questions),
    const DeepCollectionEquality().hash(_answers),
    lastUpdated,
  );

  /// Create a copy of ConversationHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationHistoryImplCopyWith<_$ConversationHistoryImpl> get copyWith =>
      __$$ConversationHistoryImplCopyWithImpl<_$ConversationHistoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationHistoryImplToJson(this);
  }
}

abstract class _ConversationHistory implements ConversationHistory {
  const factory _ConversationHistory({
    required final String id,
    required final List<OfflineQuestion> questions,
    required final List<OfflineAnswer> answers,
    required final DateTime lastUpdated,
  }) = _$ConversationHistoryImpl;

  factory _ConversationHistory.fromJson(Map<String, dynamic> json) =
      _$ConversationHistoryImpl.fromJson;

  @override
  String get id;
  @override
  List<OfflineQuestion> get questions;
  @override
  List<OfflineAnswer> get answers;
  @override
  DateTime get lastUpdated;

  /// Create a copy of ConversationHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationHistoryImplCopyWith<_$ConversationHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InferenceResult _$InferenceResultFromJson(Map<String, dynamic> json) {
  return _InferenceResult.fromJson(json);
}

/// @nodoc
mixin _$InferenceResult {
  String get extractedAnswer => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  int get durationMs => throw _privateConstructorUsedError;
  String get sourceDocumentId => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this InferenceResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InferenceResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InferenceResultCopyWith<InferenceResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InferenceResultCopyWith<$Res> {
  factory $InferenceResultCopyWith(
    InferenceResult value,
    $Res Function(InferenceResult) then,
  ) = _$InferenceResultCopyWithImpl<$Res, InferenceResult>;
  @useResult
  $Res call({
    String extractedAnswer,
    double confidence,
    int durationMs,
    String sourceDocumentId,
    bool isSuccessful,
    String? errorMessage,
  });
}

/// @nodoc
class _$InferenceResultCopyWithImpl<$Res, $Val extends InferenceResult>
    implements $InferenceResultCopyWith<$Res> {
  _$InferenceResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InferenceResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extractedAnswer = null,
    Object? confidence = null,
    Object? durationMs = null,
    Object? sourceDocumentId = null,
    Object? isSuccessful = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            extractedAnswer: null == extractedAnswer
                ? _value.extractedAnswer
                : extractedAnswer // ignore: cast_nullable_to_non_nullable
                      as String,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            durationMs: null == durationMs
                ? _value.durationMs
                : durationMs // ignore: cast_nullable_to_non_nullable
                      as int,
            sourceDocumentId: null == sourceDocumentId
                ? _value.sourceDocumentId
                : sourceDocumentId // ignore: cast_nullable_to_non_nullable
                      as String,
            isSuccessful: null == isSuccessful
                ? _value.isSuccessful
                : isSuccessful // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InferenceResultImplCopyWith<$Res>
    implements $InferenceResultCopyWith<$Res> {
  factory _$$InferenceResultImplCopyWith(
    _$InferenceResultImpl value,
    $Res Function(_$InferenceResultImpl) then,
  ) = __$$InferenceResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String extractedAnswer,
    double confidence,
    int durationMs,
    String sourceDocumentId,
    bool isSuccessful,
    String? errorMessage,
  });
}

/// @nodoc
class __$$InferenceResultImplCopyWithImpl<$Res>
    extends _$InferenceResultCopyWithImpl<$Res, _$InferenceResultImpl>
    implements _$$InferenceResultImplCopyWith<$Res> {
  __$$InferenceResultImplCopyWithImpl(
    _$InferenceResultImpl _value,
    $Res Function(_$InferenceResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InferenceResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extractedAnswer = null,
    Object? confidence = null,
    Object? durationMs = null,
    Object? sourceDocumentId = null,
    Object? isSuccessful = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$InferenceResultImpl(
        extractedAnswer: null == extractedAnswer
            ? _value.extractedAnswer
            : extractedAnswer // ignore: cast_nullable_to_non_nullable
                  as String,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        durationMs: null == durationMs
            ? _value.durationMs
            : durationMs // ignore: cast_nullable_to_non_nullable
                  as int,
        sourceDocumentId: null == sourceDocumentId
            ? _value.sourceDocumentId
            : sourceDocumentId // ignore: cast_nullable_to_non_nullable
                  as String,
        isSuccessful: null == isSuccessful
            ? _value.isSuccessful
            : isSuccessful // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InferenceResultImpl implements _InferenceResult {
  const _$InferenceResultImpl({
    required this.extractedAnswer,
    required this.confidence,
    required this.durationMs,
    required this.sourceDocumentId,
    required this.isSuccessful,
    this.errorMessage,
  });

  factory _$InferenceResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$InferenceResultImplFromJson(json);

  @override
  final String extractedAnswer;
  @override
  final double confidence;
  @override
  final int durationMs;
  @override
  final String sourceDocumentId;
  @override
  final bool isSuccessful;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'InferenceResult(extractedAnswer: $extractedAnswer, confidence: $confidence, durationMs: $durationMs, sourceDocumentId: $sourceDocumentId, isSuccessful: $isSuccessful, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InferenceResultImpl &&
            (identical(other.extractedAnswer, extractedAnswer) ||
                other.extractedAnswer == extractedAnswer) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.sourceDocumentId, sourceDocumentId) ||
                other.sourceDocumentId == sourceDocumentId) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    extractedAnswer,
    confidence,
    durationMs,
    sourceDocumentId,
    isSuccessful,
    errorMessage,
  );

  /// Create a copy of InferenceResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InferenceResultImplCopyWith<_$InferenceResultImpl> get copyWith =>
      __$$InferenceResultImplCopyWithImpl<_$InferenceResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InferenceResultImplToJson(this);
  }
}

abstract class _InferenceResult implements InferenceResult {
  const factory _InferenceResult({
    required final String extractedAnswer,
    required final double confidence,
    required final int durationMs,
    required final String sourceDocumentId,
    required final bool isSuccessful,
    final String? errorMessage,
  }) = _$InferenceResultImpl;

  factory _InferenceResult.fromJson(Map<String, dynamic> json) =
      _$InferenceResultImpl.fromJson;

  @override
  String get extractedAnswer;
  @override
  double get confidence;
  @override
  int get durationMs;
  @override
  String get sourceDocumentId;
  @override
  bool get isSuccessful;
  @override
  String? get errorMessage;

  /// Create a copy of InferenceResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InferenceResultImplCopyWith<_$InferenceResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
