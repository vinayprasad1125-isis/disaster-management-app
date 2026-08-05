// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AiMessage _$AiMessageFromJson(Map<String, dynamic> json) {
  return _AiMessage.fromJson(json);
}

/// @nodoc
mixin _$AiMessage {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  bool get isUser => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this AiMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiMessageCopyWith<AiMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiMessageCopyWith<$Res> {
  factory $AiMessageCopyWith(AiMessage value, $Res Function(AiMessage) then) =
      _$AiMessageCopyWithImpl<$Res, AiMessage>;
  @useResult
  $Res call({String id, String text, bool isUser, DateTime timestamp});
}

/// @nodoc
class _$AiMessageCopyWithImpl<$Res, $Val extends AiMessage>
    implements $AiMessageCopyWith<$Res> {
  _$AiMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? isUser = null,
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
            isUser: null == isUser
                ? _value.isUser
                : isUser // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$AiMessageImplCopyWith<$Res>
    implements $AiMessageCopyWith<$Res> {
  factory _$$AiMessageImplCopyWith(
    _$AiMessageImpl value,
    $Res Function(_$AiMessageImpl) then,
  ) = __$$AiMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String text, bool isUser, DateTime timestamp});
}

/// @nodoc
class __$$AiMessageImplCopyWithImpl<$Res>
    extends _$AiMessageCopyWithImpl<$Res, _$AiMessageImpl>
    implements _$$AiMessageImplCopyWith<$Res> {
  __$$AiMessageImplCopyWithImpl(
    _$AiMessageImpl _value,
    $Res Function(_$AiMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? isUser = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$AiMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        isUser: null == isUser
            ? _value.isUser
            : isUser // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$AiMessageImpl implements _AiMessage {
  const _$AiMessageImpl({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
  });

  factory _$AiMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final bool isUser;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'AiMessage(id: $id, text: $text, isUser: $isUser, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isUser, isUser) || other.isUser == isUser) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, isUser, timestamp);

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiMessageImplCopyWith<_$AiMessageImpl> get copyWith =>
      __$$AiMessageImplCopyWithImpl<_$AiMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiMessageImplToJson(this);
  }
}

abstract class _AiMessage implements AiMessage {
  const factory _AiMessage({
    required final String id,
    required final String text,
    required final bool isUser,
    required final DateTime timestamp,
  }) = _$AiMessageImpl;

  factory _AiMessage.fromJson(Map<String, dynamic> json) =
      _$AiMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  bool get isUser;
  @override
  DateTime get timestamp;

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiMessageImplCopyWith<_$AiMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
