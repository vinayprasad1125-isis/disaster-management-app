// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disaster_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DisasterReport _$DisasterReportFromJson(Map<String, dynamic> json) {
  return _DisasterReport.fromJson(json);
}

/// @nodoc
mixin _$DisasterReport {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this DisasterReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DisasterReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisasterReportCopyWith<DisasterReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisasterReportCopyWith<$Res> {
  factory $DisasterReportCopyWith(
    DisasterReport value,
    $Res Function(DisasterReport) then,
  ) = _$DisasterReportCopyWithImpl<$Res, DisasterReport>;
  @useResult
  $Res call({
    String id,
    String type,
    String description,
    String severity,
    String locationId,
    DateTime timestamp,
  });
}

/// @nodoc
class _$DisasterReportCopyWithImpl<$Res, $Val extends DisasterReport>
    implements $DisasterReportCopyWith<$Res> {
  _$DisasterReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisasterReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? description = null,
    Object? severity = null,
    Object? locationId = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as String,
            locationId: null == locationId
                ? _value.locationId
                : locationId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DisasterReportImplCopyWith<$Res>
    implements $DisasterReportCopyWith<$Res> {
  factory _$$DisasterReportImplCopyWith(
    _$DisasterReportImpl value,
    $Res Function(_$DisasterReportImpl) then,
  ) = __$$DisasterReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    String description,
    String severity,
    String locationId,
    DateTime timestamp,
  });
}

/// @nodoc
class __$$DisasterReportImplCopyWithImpl<$Res>
    extends _$DisasterReportCopyWithImpl<$Res, _$DisasterReportImpl>
    implements _$$DisasterReportImplCopyWith<$Res> {
  __$$DisasterReportImplCopyWithImpl(
    _$DisasterReportImpl _value,
    $Res Function(_$DisasterReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DisasterReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? description = null,
    Object? severity = null,
    Object? locationId = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$DisasterReportImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as String,
        locationId: null == locationId
            ? _value.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
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
class _$DisasterReportImpl implements _DisasterReport {
  const _$DisasterReportImpl({
    required this.id,
    required this.type,
    required this.description,
    required this.severity,
    required this.locationId,
    required this.timestamp,
  });

  factory _$DisasterReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisasterReportImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String description;
  @override
  final String severity;
  @override
  final String locationId;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'DisasterReport(id: $id, type: $type, description: $description, severity: $severity, locationId: $locationId, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisasterReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    description,
    severity,
    locationId,
    timestamp,
  );

  /// Create a copy of DisasterReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisasterReportImplCopyWith<_$DisasterReportImpl> get copyWith =>
      __$$DisasterReportImplCopyWithImpl<_$DisasterReportImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DisasterReportImplToJson(this);
  }
}

abstract class _DisasterReport implements DisasterReport {
  const factory _DisasterReport({
    required final String id,
    required final String type,
    required final String description,
    required final String severity,
    required final String locationId,
    required final DateTime timestamp,
  }) = _$DisasterReportImpl;

  factory _DisasterReport.fromJson(Map<String, dynamic> json) =
      _$DisasterReportImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get description;
  @override
  String get severity;
  @override
  String get locationId;
  @override
  DateTime get timestamp;

  /// Create a copy of DisasterReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisasterReportImplCopyWith<_$DisasterReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
