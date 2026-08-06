// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EmergencyMessage _$EmergencyMessageFromJson(Map<String, dynamic> json) {
  return _EmergencyMessage.fromJson(json);
}

/// @nodoc
mixin _$EmergencyMessage {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  MessageDeliveryStatus get status => throw _privateConstructorUsedError;

  /// Serializes this EmergencyMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmergencyMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmergencyMessageCopyWith<EmergencyMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyMessageCopyWith<$Res> {
  factory $EmergencyMessageCopyWith(
    EmergencyMessage value,
    $Res Function(EmergencyMessage) then,
  ) = _$EmergencyMessageCopyWithImpl<$Res, EmergencyMessage>;
  @useResult
  $Res call({
    String id,
    String text,
    String senderId,
    String receiverId,
    DateTime timestamp,
    MessageDeliveryStatus status,
  });
}

/// @nodoc
class _$EmergencyMessageCopyWithImpl<$Res, $Val extends EmergencyMessage>
    implements $EmergencyMessageCopyWith<$Res> {
  _$EmergencyMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmergencyMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? timestamp = null,
    Object? status = null,
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
            senderId: null == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as String,
            receiverId: null == receiverId
                ? _value.receiverId
                : receiverId // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MessageDeliveryStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmergencyMessageImplCopyWith<$Res>
    implements $EmergencyMessageCopyWith<$Res> {
  factory _$$EmergencyMessageImplCopyWith(
    _$EmergencyMessageImpl value,
    $Res Function(_$EmergencyMessageImpl) then,
  ) = __$$EmergencyMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String text,
    String senderId,
    String receiverId,
    DateTime timestamp,
    MessageDeliveryStatus status,
  });
}

/// @nodoc
class __$$EmergencyMessageImplCopyWithImpl<$Res>
    extends _$EmergencyMessageCopyWithImpl<$Res, _$EmergencyMessageImpl>
    implements _$$EmergencyMessageImplCopyWith<$Res> {
  __$$EmergencyMessageImplCopyWithImpl(
    _$EmergencyMessageImpl _value,
    $Res Function(_$EmergencyMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmergencyMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? timestamp = null,
    Object? status = null,
  }) {
    return _then(
      _$EmergencyMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        receiverId: null == receiverId
            ? _value.receiverId
            : receiverId // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageDeliveryStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmergencyMessageImpl implements _EmergencyMessage {
  const _$EmergencyMessageImpl({
    required this.id,
    required this.text,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
    required this.status,
  });

  factory _$EmergencyMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String senderId;
  @override
  final String receiverId;
  @override
  final DateTime timestamp;
  @override
  final MessageDeliveryStatus status;

  @override
  String toString() {
    return 'EmergencyMessage(id: $id, text: $text, senderId: $senderId, receiverId: $receiverId, timestamp: $timestamp, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    text,
    senderId,
    receiverId,
    timestamp,
    status,
  );

  /// Create a copy of EmergencyMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyMessageImplCopyWith<_$EmergencyMessageImpl> get copyWith =>
      __$$EmergencyMessageImplCopyWithImpl<_$EmergencyMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmergencyMessageImplToJson(this);
  }
}

abstract class _EmergencyMessage implements EmergencyMessage {
  const factory _EmergencyMessage({
    required final String id,
    required final String text,
    required final String senderId,
    required final String receiverId,
    required final DateTime timestamp,
    required final MessageDeliveryStatus status,
  }) = _$EmergencyMessageImpl;

  factory _EmergencyMessage.fromJson(Map<String, dynamic> json) =
      _$EmergencyMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String get senderId;
  @override
  String get receiverId;
  @override
  DateTime get timestamp;
  @override
  MessageDeliveryStatus get status;

  /// Create a copy of EmergencyMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmergencyMessageImplCopyWith<_$EmergencyMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
