// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'government_alert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GovernmentAlert _$GovernmentAlertFromJson(Map<String, dynamic> json) {
  return _GovernmentAlert.fromJson(json);
}

/// @nodoc
mixin _$GovernmentAlert {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this GovernmentAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GovernmentAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GovernmentAlertCopyWith<GovernmentAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GovernmentAlertCopyWith<$Res> {
  factory $GovernmentAlertCopyWith(
    GovernmentAlert value,
    $Res Function(GovernmentAlert) then,
  ) = _$GovernmentAlertCopyWithImpl<$Res, GovernmentAlert>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String source,
    DateTime timestamp,
  });
}

/// @nodoc
class _$GovernmentAlertCopyWithImpl<$Res, $Val extends GovernmentAlert>
    implements $GovernmentAlertCopyWith<$Res> {
  _$GovernmentAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GovernmentAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? source = null,
    Object? timestamp = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
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
abstract class _$$GovernmentAlertImplCopyWith<$Res>
    implements $GovernmentAlertCopyWith<$Res> {
  factory _$$GovernmentAlertImplCopyWith(
    _$GovernmentAlertImpl value,
    $Res Function(_$GovernmentAlertImpl) then,
  ) = __$$GovernmentAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String source,
    DateTime timestamp,
  });
}

/// @nodoc
class __$$GovernmentAlertImplCopyWithImpl<$Res>
    extends _$GovernmentAlertCopyWithImpl<$Res, _$GovernmentAlertImpl>
    implements _$$GovernmentAlertImplCopyWith<$Res> {
  __$$GovernmentAlertImplCopyWithImpl(
    _$GovernmentAlertImpl _value,
    $Res Function(_$GovernmentAlertImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GovernmentAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? source = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$GovernmentAlertImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
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
class _$GovernmentAlertImpl implements _GovernmentAlert {
  const _$GovernmentAlertImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.source,
    required this.timestamp,
  });

  factory _$GovernmentAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$GovernmentAlertImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String source;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'GovernmentAlert(id: $id, title: $title, description: $description, source: $source, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GovernmentAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, source, timestamp);

  /// Create a copy of GovernmentAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GovernmentAlertImplCopyWith<_$GovernmentAlertImpl> get copyWith =>
      __$$GovernmentAlertImplCopyWithImpl<_$GovernmentAlertImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GovernmentAlertImplToJson(this);
  }
}

abstract class _GovernmentAlert implements GovernmentAlert {
  const factory _GovernmentAlert({
    required final String id,
    required final String title,
    required final String description,
    required final String source,
    required final DateTime timestamp,
  }) = _$GovernmentAlertImpl;

  factory _GovernmentAlert.fromJson(Map<String, dynamic> json) =
      _$GovernmentAlertImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get source;
  @override
  DateTime get timestamp;

  /// Create a copy of GovernmentAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GovernmentAlertImplCopyWith<_$GovernmentAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
