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
  String get messageId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  String get messageType =>
      throw _privateConstructorUsedError; // e.g., 'need_help', 'safe', 'food'
  DateTime get timestamp => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

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
    String messageId,
    String senderId,
    String receiverId,
    String messageType,
    DateTime timestamp,
    double? latitude,
    double? longitude,
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
    Object? messageId = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? messageType = null,
    Object? timestamp = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(
      _value.copyWith(
            messageId: null == messageId
                ? _value.messageId
                : messageId // ignore: cast_nullable_to_non_nullable
                      as String,
            senderId: null == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as String,
            receiverId: null == receiverId
                ? _value.receiverId
                : receiverId // ignore: cast_nullable_to_non_nullable
                      as String,
            messageType: null == messageType
                ? _value.messageType
                : messageType // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
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
    String messageId,
    String senderId,
    String receiverId,
    String messageType,
    DateTime timestamp,
    double? latitude,
    double? longitude,
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
    Object? messageId = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? messageType = null,
    Object? timestamp = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(
      _$EmergencyMessageImpl(
        messageId: null == messageId
            ? _value.messageId
            : messageId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        receiverId: null == receiverId
            ? _value.receiverId
            : receiverId // ignore: cast_nullable_to_non_nullable
                  as String,
        messageType: null == messageType
            ? _value.messageType
            : messageType // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmergencyMessageImpl implements _EmergencyMessage {
  const _$EmergencyMessageImpl({
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    required this.messageType,
    required this.timestamp,
    this.latitude,
    this.longitude,
  });

  factory _$EmergencyMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyMessageImplFromJson(json);

  @override
  final String messageId;
  @override
  final String senderId;
  @override
  final String receiverId;
  @override
  final String messageType;
  // e.g., 'need_help', 'safe', 'food'
  @override
  final DateTime timestamp;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'EmergencyMessage(messageId: $messageId, senderId: $senderId, receiverId: $receiverId, messageType: $messageType, timestamp: $timestamp, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyMessageImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    messageId,
    senderId,
    receiverId,
    messageType,
    timestamp,
    latitude,
    longitude,
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
    required final String messageId,
    required final String senderId,
    required final String receiverId,
    required final String messageType,
    required final DateTime timestamp,
    final double? latitude,
    final double? longitude,
  }) = _$EmergencyMessageImpl;

  factory _EmergencyMessage.fromJson(Map<String, dynamic> json) =
      _$EmergencyMessageImpl.fromJson;

  @override
  String get messageId;
  @override
  String get senderId;
  @override
  String get receiverId;
  @override
  String get messageType; // e.g., 'need_help', 'safe', 'food'
  @override
  DateTime get timestamp;
  @override
  double? get latitude;
  @override
  double? get longitude;

  /// Create a copy of EmergencyMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmergencyMessageImplCopyWith<_$EmergencyMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
