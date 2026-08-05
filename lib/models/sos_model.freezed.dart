// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sos_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Sos _$SosFromJson(Map<String, dynamic> json) {
  return _Sos.fromJson(json);
}

/// @nodoc
mixin _$Sos {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this Sos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Sos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SosCopyWith<Sos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SosCopyWith<$Res> {
  factory $SosCopyWith(Sos value, $Res Function(Sos) then) =
      _$SosCopyWithImpl<$Res, Sos>;
  @useResult
  $Res call({
    String id,
    String userId,
    String locationId,
    DateTime timestamp,
    String status,
  });
}

/// @nodoc
class _$SosCopyWithImpl<$Res, $Val extends Sos> implements $SosCopyWith<$Res> {
  _$SosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? locationId = null,
    Object? timestamp = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            locationId: null == locationId
                ? _value.locationId
                : locationId // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SosImplCopyWith<$Res> implements $SosCopyWith<$Res> {
  factory _$$SosImplCopyWith(_$SosImpl value, $Res Function(_$SosImpl) then) =
      __$$SosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String locationId,
    DateTime timestamp,
    String status,
  });
}

/// @nodoc
class __$$SosImplCopyWithImpl<$Res> extends _$SosCopyWithImpl<$Res, _$SosImpl>
    implements _$$SosImplCopyWith<$Res> {
  __$$SosImplCopyWithImpl(_$SosImpl _value, $Res Function(_$SosImpl) _then)
    : super(_value, _then);

  /// Create a copy of Sos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? locationId = null,
    Object? timestamp = null,
    Object? status = null,
  }) {
    return _then(
      _$SosImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        locationId: null == locationId
            ? _value.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SosImpl implements _Sos {
  const _$SosImpl({
    required this.id,
    required this.userId,
    required this.locationId,
    required this.timestamp,
    required this.status,
  });

  factory _$SosImpl.fromJson(Map<String, dynamic> json) =>
      _$$SosImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String locationId;
  @override
  final DateTime timestamp;
  @override
  final String status;

  @override
  String toString() {
    return 'Sos(id: $id, userId: $userId, locationId: $locationId, timestamp: $timestamp, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SosImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, locationId, timestamp, status);

  /// Create a copy of Sos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SosImplCopyWith<_$SosImpl> get copyWith =>
      __$$SosImplCopyWithImpl<_$SosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SosImplToJson(this);
  }
}

abstract class _Sos implements Sos {
  const factory _Sos({
    required final String id,
    required final String userId,
    required final String locationId,
    required final DateTime timestamp,
    required final String status,
  }) = _$SosImpl;

  factory _Sos.fromJson(Map<String, dynamic> json) = _$SosImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get locationId;
  @override
  DateTime get timestamp;
  @override
  String get status;

  /// Create a copy of Sos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SosImplCopyWith<_$SosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
