// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disaster_risk_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DisasterRisk _$DisasterRiskFromJson(Map<String, dynamic> json) {
  return _DisasterRisk.fromJson(json);
}

/// @nodoc
mixin _$DisasterRisk {
  String get level => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get affectedAreas => throw _privateConstructorUsedError;

  /// Serializes this DisasterRisk to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DisasterRisk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisasterRiskCopyWith<DisasterRisk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisasterRiskCopyWith<$Res> {
  factory $DisasterRiskCopyWith(
    DisasterRisk value,
    $Res Function(DisasterRisk) then,
  ) = _$DisasterRiskCopyWithImpl<$Res, DisasterRisk>;
  @useResult
  $Res call({String level, String description, List<String> affectedAreas});
}

/// @nodoc
class _$DisasterRiskCopyWithImpl<$Res, $Val extends DisasterRisk>
    implements $DisasterRiskCopyWith<$Res> {
  _$DisasterRiskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisasterRisk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? description = null,
    Object? affectedAreas = null,
  }) {
    return _then(
      _value.copyWith(
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            affectedAreas: null == affectedAreas
                ? _value.affectedAreas
                : affectedAreas // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DisasterRiskImplCopyWith<$Res>
    implements $DisasterRiskCopyWith<$Res> {
  factory _$$DisasterRiskImplCopyWith(
    _$DisasterRiskImpl value,
    $Res Function(_$DisasterRiskImpl) then,
  ) = __$$DisasterRiskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String level, String description, List<String> affectedAreas});
}

/// @nodoc
class __$$DisasterRiskImplCopyWithImpl<$Res>
    extends _$DisasterRiskCopyWithImpl<$Res, _$DisasterRiskImpl>
    implements _$$DisasterRiskImplCopyWith<$Res> {
  __$$DisasterRiskImplCopyWithImpl(
    _$DisasterRiskImpl _value,
    $Res Function(_$DisasterRiskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DisasterRisk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? description = null,
    Object? affectedAreas = null,
  }) {
    return _then(
      _$DisasterRiskImpl(
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        affectedAreas: null == affectedAreas
            ? _value._affectedAreas
            : affectedAreas // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DisasterRiskImpl implements _DisasterRisk {
  const _$DisasterRiskImpl({
    required this.level,
    required this.description,
    required final List<String> affectedAreas,
  }) : _affectedAreas = affectedAreas;

  factory _$DisasterRiskImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisasterRiskImplFromJson(json);

  @override
  final String level;
  @override
  final String description;
  final List<String> _affectedAreas;
  @override
  List<String> get affectedAreas {
    if (_affectedAreas is EqualUnmodifiableListView) return _affectedAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_affectedAreas);
  }

  @override
  String toString() {
    return 'DisasterRisk(level: $level, description: $description, affectedAreas: $affectedAreas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisasterRiskImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._affectedAreas,
              _affectedAreas,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    level,
    description,
    const DeepCollectionEquality().hash(_affectedAreas),
  );

  /// Create a copy of DisasterRisk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisasterRiskImplCopyWith<_$DisasterRiskImpl> get copyWith =>
      __$$DisasterRiskImplCopyWithImpl<_$DisasterRiskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisasterRiskImplToJson(this);
  }
}

abstract class _DisasterRisk implements DisasterRisk {
  const factory _DisasterRisk({
    required final String level,
    required final String description,
    required final List<String> affectedAreas,
  }) = _$DisasterRiskImpl;

  factory _DisasterRisk.fromJson(Map<String, dynamic> json) =
      _$DisasterRiskImpl.fromJson;

  @override
  String get level;
  @override
  String get description;
  @override
  List<String> get affectedAreas;

  /// Create a copy of DisasterRisk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisasterRiskImplCopyWith<_$DisasterRiskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
