// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'communication_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CommunicationSession _$CommunicationSessionFromJson(Map<String, dynamic> json) {
  return _CommunicationSession.fromJson(json);
}

/// @nodoc
mixin _$CommunicationSession {
  String get sessionId => throw _privateConstructorUsedError;
  NearbyDevice get peerDevice => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  CallState get callState => throw _privateConstructorUsedError;

  /// Serializes this CommunicationSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunicationSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunicationSessionCopyWith<CommunicationSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunicationSessionCopyWith<$Res> {
  factory $CommunicationSessionCopyWith(
    CommunicationSession value,
    $Res Function(CommunicationSession) then,
  ) = _$CommunicationSessionCopyWithImpl<$Res, CommunicationSession>;
  @useResult
  $Res call({
    String sessionId,
    NearbyDevice peerDevice,
    DateTime startTime,
    DateTime? endTime,
    CallState callState,
  });

  $NearbyDeviceCopyWith<$Res> get peerDevice;
}

/// @nodoc
class _$CommunicationSessionCopyWithImpl<
  $Res,
  $Val extends CommunicationSession
>
    implements $CommunicationSessionCopyWith<$Res> {
  _$CommunicationSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunicationSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? peerDevice = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? callState = null,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            peerDevice: null == peerDevice
                ? _value.peerDevice
                : peerDevice // ignore: cast_nullable_to_non_nullable
                      as NearbyDevice,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            callState: null == callState
                ? _value.callState
                : callState // ignore: cast_nullable_to_non_nullable
                      as CallState,
          )
          as $Val,
    );
  }

  /// Create a copy of CommunicationSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearbyDeviceCopyWith<$Res> get peerDevice {
    return $NearbyDeviceCopyWith<$Res>(_value.peerDevice, (value) {
      return _then(_value.copyWith(peerDevice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommunicationSessionImplCopyWith<$Res>
    implements $CommunicationSessionCopyWith<$Res> {
  factory _$$CommunicationSessionImplCopyWith(
    _$CommunicationSessionImpl value,
    $Res Function(_$CommunicationSessionImpl) then,
  ) = __$$CommunicationSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sessionId,
    NearbyDevice peerDevice,
    DateTime startTime,
    DateTime? endTime,
    CallState callState,
  });

  @override
  $NearbyDeviceCopyWith<$Res> get peerDevice;
}

/// @nodoc
class __$$CommunicationSessionImplCopyWithImpl<$Res>
    extends _$CommunicationSessionCopyWithImpl<$Res, _$CommunicationSessionImpl>
    implements _$$CommunicationSessionImplCopyWith<$Res> {
  __$$CommunicationSessionImplCopyWithImpl(
    _$CommunicationSessionImpl _value,
    $Res Function(_$CommunicationSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommunicationSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? peerDevice = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? callState = null,
  }) {
    return _then(
      _$CommunicationSessionImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        peerDevice: null == peerDevice
            ? _value.peerDevice
            : peerDevice // ignore: cast_nullable_to_non_nullable
                  as NearbyDevice,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        callState: null == callState
            ? _value.callState
            : callState // ignore: cast_nullable_to_non_nullable
                  as CallState,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunicationSessionImpl implements _CommunicationSession {
  const _$CommunicationSessionImpl({
    required this.sessionId,
    required this.peerDevice,
    required this.startTime,
    this.endTime,
    required this.callState,
  });

  factory _$CommunicationSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunicationSessionImplFromJson(json);

  @override
  final String sessionId;
  @override
  final NearbyDevice peerDevice;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  final CallState callState;

  @override
  String toString() {
    return 'CommunicationSession(sessionId: $sessionId, peerDevice: $peerDevice, startTime: $startTime, endTime: $endTime, callState: $callState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunicationSessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.peerDevice, peerDevice) ||
                other.peerDevice == peerDevice) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.callState, callState) ||
                other.callState == callState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    peerDevice,
    startTime,
    endTime,
    callState,
  );

  /// Create a copy of CommunicationSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunicationSessionImplCopyWith<_$CommunicationSessionImpl>
  get copyWith =>
      __$$CommunicationSessionImplCopyWithImpl<_$CommunicationSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunicationSessionImplToJson(this);
  }
}

abstract class _CommunicationSession implements CommunicationSession {
  const factory _CommunicationSession({
    required final String sessionId,
    required final NearbyDevice peerDevice,
    required final DateTime startTime,
    final DateTime? endTime,
    required final CallState callState,
  }) = _$CommunicationSessionImpl;

  factory _CommunicationSession.fromJson(Map<String, dynamic> json) =
      _$CommunicationSessionImpl.fromJson;

  @override
  String get sessionId;
  @override
  NearbyDevice get peerDevice;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  CallState get callState;

  /// Create a copy of CommunicationSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunicationSessionImplCopyWith<_$CommunicationSessionImpl>
  get copyWith => throw _privateConstructorUsedError;
}
