// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_step_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RouteStep _$RouteStepFromJson(Map<String, dynamic> json) {
  return _RouteStep.fromJson(json);
}

/// @nodoc
mixin _$RouteStep {
  String get instruction => throw _privateConstructorUsedError;
  String get distance => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;

  /// Serializes this RouteStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RouteStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteStepCopyWith<RouteStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStepCopyWith<$Res> {
  factory $RouteStepCopyWith(RouteStep value, $Res Function(RouteStep) then) =
      _$RouteStepCopyWithImpl<$Res, RouteStep>;
  @useResult
  $Res call({String instruction, String distance, String duration});
}

/// @nodoc
class _$RouteStepCopyWithImpl<$Res, $Val extends RouteStep>
    implements $RouteStepCopyWith<$Res> {
  _$RouteStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instruction = null,
    Object? distance = null,
    Object? duration = null,
  }) {
    return _then(
      _value.copyWith(
            instruction: null == instruction
                ? _value.instruction
                : instruction // ignore: cast_nullable_to_non_nullable
                      as String,
            distance: null == distance
                ? _value.distance
                : distance // ignore: cast_nullable_to_non_nullable
                      as String,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RouteStepImplCopyWith<$Res>
    implements $RouteStepCopyWith<$Res> {
  factory _$$RouteStepImplCopyWith(
    _$RouteStepImpl value,
    $Res Function(_$RouteStepImpl) then,
  ) = __$$RouteStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String instruction, String distance, String duration});
}

/// @nodoc
class __$$RouteStepImplCopyWithImpl<$Res>
    extends _$RouteStepCopyWithImpl<$Res, _$RouteStepImpl>
    implements _$$RouteStepImplCopyWith<$Res> {
  __$$RouteStepImplCopyWithImpl(
    _$RouteStepImpl _value,
    $Res Function(_$RouteStepImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RouteStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instruction = null,
    Object? distance = null,
    Object? duration = null,
  }) {
    return _then(
      _$RouteStepImpl(
        instruction: null == instruction
            ? _value.instruction
            : instruction // ignore: cast_nullable_to_non_nullable
                  as String,
        distance: null == distance
            ? _value.distance
            : distance // ignore: cast_nullable_to_non_nullable
                  as String,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteStepImpl implements _RouteStep {
  const _$RouteStepImpl({
    required this.instruction,
    required this.distance,
    required this.duration,
  });

  factory _$RouteStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteStepImplFromJson(json);

  @override
  final String instruction;
  @override
  final String distance;
  @override
  final String duration;

  @override
  String toString() {
    return 'RouteStep(instruction: $instruction, distance: $distance, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteStepImpl &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, instruction, distance, duration);

  /// Create a copy of RouteStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteStepImplCopyWith<_$RouteStepImpl> get copyWith =>
      __$$RouteStepImplCopyWithImpl<_$RouteStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteStepImplToJson(this);
  }
}

abstract class _RouteStep implements RouteStep {
  const factory _RouteStep({
    required final String instruction,
    required final String distance,
    required final String duration,
  }) = _$RouteStepImpl;

  factory _RouteStep.fromJson(Map<String, dynamic> json) =
      _$RouteStepImpl.fromJson;

  @override
  String get instruction;
  @override
  String get distance;
  @override
  String get duration;

  /// Create a copy of RouteStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteStepImplCopyWith<_$RouteStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
