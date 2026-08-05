// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) {
  return _WeatherForecast.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecast {
  DateTime get date => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;

  /// Serializes this WeatherForecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherForecastCopyWith<WeatherForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastCopyWith<$Res> {
  factory $WeatherForecastCopyWith(
    WeatherForecast value,
    $Res Function(WeatherForecast) then,
  ) = _$WeatherForecastCopyWithImpl<$Res, WeatherForecast>;
  @useResult
  $Res call({DateTime date, double temperature, String condition});
}

/// @nodoc
class _$WeatherForecastCopyWithImpl<$Res, $Val extends WeatherForecast>
    implements $WeatherForecastCopyWith<$Res> {
  _$WeatherForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? temperature = null,
    Object? condition = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            temperature: null == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as double,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeatherForecastImplCopyWith<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  factory _$$WeatherForecastImplCopyWith(
    _$WeatherForecastImpl value,
    $Res Function(_$WeatherForecastImpl) then,
  ) = __$$WeatherForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double temperature, String condition});
}

/// @nodoc
class __$$WeatherForecastImplCopyWithImpl<$Res>
    extends _$WeatherForecastCopyWithImpl<$Res, _$WeatherForecastImpl>
    implements _$$WeatherForecastImplCopyWith<$Res> {
  __$$WeatherForecastImplCopyWithImpl(
    _$WeatherForecastImpl _value,
    $Res Function(_$WeatherForecastImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? temperature = null,
    Object? condition = null,
  }) {
    return _then(
      _$WeatherForecastImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        temperature: null == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as double,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherForecastImpl implements _WeatherForecast {
  const _$WeatherForecastImpl({
    required this.date,
    required this.temperature,
    required this.condition,
  });

  factory _$WeatherForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherForecastImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double temperature;
  @override
  final String condition;

  @override
  String toString() {
    return 'WeatherForecast(date: $date, temperature: $temperature, condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, temperature, condition);

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      __$$WeatherForecastImplCopyWithImpl<_$WeatherForecastImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherForecastImplToJson(this);
  }
}

abstract class _WeatherForecast implements WeatherForecast {
  const factory _WeatherForecast({
    required final DateTime date,
    required final double temperature,
    required final String condition,
  }) = _$WeatherForecastImpl;

  factory _WeatherForecast.fromJson(Map<String, dynamic> json) =
      _$WeatherForecastImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get temperature;
  @override
  String get condition;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
