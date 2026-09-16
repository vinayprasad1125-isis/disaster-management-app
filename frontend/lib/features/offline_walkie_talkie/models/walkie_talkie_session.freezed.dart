// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'walkie_talkie_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WalkieTalkieSession _$WalkieTalkieSessionFromJson(Map<String, dynamic> json) {
  return _WalkieTalkieSession.fromJson(json);
}

/// @nodoc
mixin _$WalkieTalkieSession {
  CommunicationSession get communicationSession =>
      throw _privateConstructorUsedError;
  WalkieTalkieStatus get status => throw _privateConstructorUsedError;
  bool get isSpeakerOn => throw _privateConstructorUsedError;
  bool get isMuted => throw _privateConstructorUsedError;
  Duration? get lastTransmissionDuration => throw _privateConstructorUsedError;

  /// Serializes this WalkieTalkieSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalkieTalkieSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalkieTalkieSessionCopyWith<WalkieTalkieSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkieTalkieSessionCopyWith<$Res> {
  factory $WalkieTalkieSessionCopyWith(
    WalkieTalkieSession value,
    $Res Function(WalkieTalkieSession) then,
  ) = _$WalkieTalkieSessionCopyWithImpl<$Res, WalkieTalkieSession>;
  @useResult
  $Res call({
    CommunicationSession communicationSession,
    WalkieTalkieStatus status,
    bool isSpeakerOn,
    bool isMuted,
    Duration? lastTransmissionDuration,
  });

  $CommunicationSessionCopyWith<$Res> get communicationSession;
}

/// @nodoc
class _$WalkieTalkieSessionCopyWithImpl<$Res, $Val extends WalkieTalkieSession>
    implements $WalkieTalkieSessionCopyWith<$Res> {
  _$WalkieTalkieSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalkieTalkieSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communicationSession = null,
    Object? status = null,
    Object? isSpeakerOn = null,
    Object? isMuted = null,
    Object? lastTransmissionDuration = freezed,
  }) {
    return _then(
      _value.copyWith(
            communicationSession: null == communicationSession
                ? _value.communicationSession
                : communicationSession // ignore: cast_nullable_to_non_nullable
                      as CommunicationSession,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as WalkieTalkieStatus,
            isSpeakerOn: null == isSpeakerOn
                ? _value.isSpeakerOn
                : isSpeakerOn // ignore: cast_nullable_to_non_nullable
                      as bool,
            isMuted: null == isMuted
                ? _value.isMuted
                : isMuted // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastTransmissionDuration: freezed == lastTransmissionDuration
                ? _value.lastTransmissionDuration
                : lastTransmissionDuration // ignore: cast_nullable_to_non_nullable
                      as Duration?,
          )
          as $Val,
    );
  }

  /// Create a copy of WalkieTalkieSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunicationSessionCopyWith<$Res> get communicationSession {
    return $CommunicationSessionCopyWith<$Res>(_value.communicationSession, (
      value,
    ) {
      return _then(_value.copyWith(communicationSession: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalkieTalkieSessionImplCopyWith<$Res>
    implements $WalkieTalkieSessionCopyWith<$Res> {
  factory _$$WalkieTalkieSessionImplCopyWith(
    _$WalkieTalkieSessionImpl value,
    $Res Function(_$WalkieTalkieSessionImpl) then,
  ) = __$$WalkieTalkieSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CommunicationSession communicationSession,
    WalkieTalkieStatus status,
    bool isSpeakerOn,
    bool isMuted,
    Duration? lastTransmissionDuration,
  });

  @override
  $CommunicationSessionCopyWith<$Res> get communicationSession;
}

/// @nodoc
class __$$WalkieTalkieSessionImplCopyWithImpl<$Res>
    extends _$WalkieTalkieSessionCopyWithImpl<$Res, _$WalkieTalkieSessionImpl>
    implements _$$WalkieTalkieSessionImplCopyWith<$Res> {
  __$$WalkieTalkieSessionImplCopyWithImpl(
    _$WalkieTalkieSessionImpl _value,
    $Res Function(_$WalkieTalkieSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WalkieTalkieSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communicationSession = null,
    Object? status = null,
    Object? isSpeakerOn = null,
    Object? isMuted = null,
    Object? lastTransmissionDuration = freezed,
  }) {
    return _then(
      _$WalkieTalkieSessionImpl(
        communicationSession: null == communicationSession
            ? _value.communicationSession
            : communicationSession // ignore: cast_nullable_to_non_nullable
                  as CommunicationSession,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as WalkieTalkieStatus,
        isSpeakerOn: null == isSpeakerOn
            ? _value.isSpeakerOn
            : isSpeakerOn // ignore: cast_nullable_to_non_nullable
                  as bool,
        isMuted: null == isMuted
            ? _value.isMuted
            : isMuted // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastTransmissionDuration: freezed == lastTransmissionDuration
            ? _value.lastTransmissionDuration
            : lastTransmissionDuration // ignore: cast_nullable_to_non_nullable
                  as Duration?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WalkieTalkieSessionImpl implements _WalkieTalkieSession {
  const _$WalkieTalkieSessionImpl({
    required this.communicationSession,
    this.status = WalkieTalkieStatus.idle,
    this.isSpeakerOn = false,
    this.isMuted = false,
    this.lastTransmissionDuration,
  });

  factory _$WalkieTalkieSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalkieTalkieSessionImplFromJson(json);

  @override
  final CommunicationSession communicationSession;
  @override
  @JsonKey()
  final WalkieTalkieStatus status;
  @override
  @JsonKey()
  final bool isSpeakerOn;
  @override
  @JsonKey()
  final bool isMuted;
  @override
  final Duration? lastTransmissionDuration;

  @override
  String toString() {
    return 'WalkieTalkieSession(communicationSession: $communicationSession, status: $status, isSpeakerOn: $isSpeakerOn, isMuted: $isMuted, lastTransmissionDuration: $lastTransmissionDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalkieTalkieSessionImpl &&
            (identical(other.communicationSession, communicationSession) ||
                other.communicationSession == communicationSession) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isSpeakerOn, isSpeakerOn) ||
                other.isSpeakerOn == isSpeakerOn) &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted) &&
            (identical(
                  other.lastTransmissionDuration,
                  lastTransmissionDuration,
                ) ||
                other.lastTransmissionDuration == lastTransmissionDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    communicationSession,
    status,
    isSpeakerOn,
    isMuted,
    lastTransmissionDuration,
  );

  /// Create a copy of WalkieTalkieSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalkieTalkieSessionImplCopyWith<_$WalkieTalkieSessionImpl> get copyWith =>
      __$$WalkieTalkieSessionImplCopyWithImpl<_$WalkieTalkieSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WalkieTalkieSessionImplToJson(this);
  }
}

abstract class _WalkieTalkieSession implements WalkieTalkieSession {
  const factory _WalkieTalkieSession({
    required final CommunicationSession communicationSession,
    final WalkieTalkieStatus status,
    final bool isSpeakerOn,
    final bool isMuted,
    final Duration? lastTransmissionDuration,
  }) = _$WalkieTalkieSessionImpl;

  factory _WalkieTalkieSession.fromJson(Map<String, dynamic> json) =
      _$WalkieTalkieSessionImpl.fromJson;

  @override
  CommunicationSession get communicationSession;
  @override
  WalkieTalkieStatus get status;
  @override
  bool get isSpeakerOn;
  @override
  bool get isMuted;
  @override
  Duration? get lastTransmissionDuration;

  /// Create a copy of WalkieTalkieSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalkieTalkieSessionImplCopyWith<_$WalkieTalkieSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
