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
  NearbyDevice get remoteDevice => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  ConnectionQuality get quality => throw _privateConstructorUsedError;
  List<String> get errorLogs => throw _privateConstructorUsedError;

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
    NearbyDevice remoteDevice,
    DateTime startTime,
    DateTime? endTime,
    ConnectionQuality quality,
    List<String> errorLogs,
  });

  $NearbyDeviceCopyWith<$Res> get remoteDevice;
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
    Object? remoteDevice = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? quality = null,
    Object? errorLogs = null,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            remoteDevice: null == remoteDevice
                ? _value.remoteDevice
                : remoteDevice // ignore: cast_nullable_to_non_nullable
                      as NearbyDevice,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            quality: null == quality
                ? _value.quality
                : quality // ignore: cast_nullable_to_non_nullable
                      as ConnectionQuality,
            errorLogs: null == errorLogs
                ? _value.errorLogs
                : errorLogs // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of CommunicationSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearbyDeviceCopyWith<$Res> get remoteDevice {
    return $NearbyDeviceCopyWith<$Res>(_value.remoteDevice, (value) {
      return _then(_value.copyWith(remoteDevice: value) as $Val);
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
    NearbyDevice remoteDevice,
    DateTime startTime,
    DateTime? endTime,
    ConnectionQuality quality,
    List<String> errorLogs,
  });

  @override
  $NearbyDeviceCopyWith<$Res> get remoteDevice;
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
    Object? remoteDevice = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? quality = null,
    Object? errorLogs = null,
  }) {
    return _then(
      _$CommunicationSessionImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        remoteDevice: null == remoteDevice
            ? _value.remoteDevice
            : remoteDevice // ignore: cast_nullable_to_non_nullable
                  as NearbyDevice,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        quality: null == quality
            ? _value.quality
            : quality // ignore: cast_nullable_to_non_nullable
                  as ConnectionQuality,
        errorLogs: null == errorLogs
            ? _value._errorLogs
            : errorLogs // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunicationSessionImpl implements _CommunicationSession {
  const _$CommunicationSessionImpl({
    required this.sessionId,
    required this.remoteDevice,
    required this.startTime,
    this.endTime,
    this.quality = ConnectionQuality.high,
    final List<String> errorLogs = const [],
  }) : _errorLogs = errorLogs;

  factory _$CommunicationSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunicationSessionImplFromJson(json);

  @override
  final String sessionId;
  @override
  final NearbyDevice remoteDevice;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  @JsonKey()
  final ConnectionQuality quality;
  final List<String> _errorLogs;
  @override
  @JsonKey()
  List<String> get errorLogs {
    if (_errorLogs is EqualUnmodifiableListView) return _errorLogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errorLogs);
  }

  @override
  String toString() {
    return 'CommunicationSession(sessionId: $sessionId, remoteDevice: $remoteDevice, startTime: $startTime, endTime: $endTime, quality: $quality, errorLogs: $errorLogs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunicationSessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.remoteDevice, remoteDevice) ||
                other.remoteDevice == remoteDevice) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            const DeepCollectionEquality().equals(
              other._errorLogs,
              _errorLogs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    remoteDevice,
    startTime,
    endTime,
    quality,
    const DeepCollectionEquality().hash(_errorLogs),
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
    required final NearbyDevice remoteDevice,
    required final DateTime startTime,
    final DateTime? endTime,
    final ConnectionQuality quality,
    final List<String> errorLogs,
  }) = _$CommunicationSessionImpl;

  factory _CommunicationSession.fromJson(Map<String, dynamic> json) =
      _$CommunicationSessionImpl.fromJson;

  @override
  String get sessionId;
  @override
  NearbyDevice get remoteDevice;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  ConnectionQuality get quality;
  @override
  List<String> get errorLogs;

  /// Create a copy of CommunicationSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunicationSessionImplCopyWith<_$CommunicationSessionImpl>
  get copyWith => throw _privateConstructorUsedError;
}
