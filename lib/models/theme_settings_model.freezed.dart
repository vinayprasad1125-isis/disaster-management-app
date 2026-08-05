// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ThemeSettings _$ThemeSettingsFromJson(Map<String, dynamic> json) {
  return _ThemeSettings.fromJson(json);
}

/// @nodoc
mixin _$ThemeSettings {
  bool get isDarkMode => throw _privateConstructorUsedError;
  bool get useSystemTheme => throw _privateConstructorUsedError;

  /// Serializes this ThemeSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThemeSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeSettingsCopyWith<ThemeSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeSettingsCopyWith<$Res> {
  factory $ThemeSettingsCopyWith(
    ThemeSettings value,
    $Res Function(ThemeSettings) then,
  ) = _$ThemeSettingsCopyWithImpl<$Res, ThemeSettings>;
  @useResult
  $Res call({bool isDarkMode, bool useSystemTheme});
}

/// @nodoc
class _$ThemeSettingsCopyWithImpl<$Res, $Val extends ThemeSettings>
    implements $ThemeSettingsCopyWith<$Res> {
  _$ThemeSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isDarkMode = null, Object? useSystemTheme = null}) {
    return _then(
      _value.copyWith(
            isDarkMode: null == isDarkMode
                ? _value.isDarkMode
                : isDarkMode // ignore: cast_nullable_to_non_nullable
                      as bool,
            useSystemTheme: null == useSystemTheme
                ? _value.useSystemTheme
                : useSystemTheme // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThemeSettingsImplCopyWith<$Res>
    implements $ThemeSettingsCopyWith<$Res> {
  factory _$$ThemeSettingsImplCopyWith(
    _$ThemeSettingsImpl value,
    $Res Function(_$ThemeSettingsImpl) then,
  ) = __$$ThemeSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, bool useSystemTheme});
}

/// @nodoc
class __$$ThemeSettingsImplCopyWithImpl<$Res>
    extends _$ThemeSettingsCopyWithImpl<$Res, _$ThemeSettingsImpl>
    implements _$$ThemeSettingsImplCopyWith<$Res> {
  __$$ThemeSettingsImplCopyWithImpl(
    _$ThemeSettingsImpl _value,
    $Res Function(_$ThemeSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isDarkMode = null, Object? useSystemTheme = null}) {
    return _then(
      _$ThemeSettingsImpl(
        isDarkMode: null == isDarkMode
            ? _value.isDarkMode
            : isDarkMode // ignore: cast_nullable_to_non_nullable
                  as bool,
        useSystemTheme: null == useSystemTheme
            ? _value.useSystemTheme
            : useSystemTheme // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeSettingsImpl implements _ThemeSettings {
  const _$ThemeSettingsImpl({
    required this.isDarkMode,
    required this.useSystemTheme,
  });

  factory _$ThemeSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeSettingsImplFromJson(json);

  @override
  final bool isDarkMode;
  @override
  final bool useSystemTheme;

  @override
  String toString() {
    return 'ThemeSettings(isDarkMode: $isDarkMode, useSystemTheme: $useSystemTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeSettingsImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.useSystemTheme, useSystemTheme) ||
                other.useSystemTheme == useSystemTheme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode, useSystemTheme);

  /// Create a copy of ThemeSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeSettingsImplCopyWith<_$ThemeSettingsImpl> get copyWith =>
      __$$ThemeSettingsImplCopyWithImpl<_$ThemeSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeSettingsImplToJson(this);
  }
}

abstract class _ThemeSettings implements ThemeSettings {
  const factory _ThemeSettings({
    required final bool isDarkMode,
    required final bool useSystemTheme,
  }) = _$ThemeSettingsImpl;

  factory _ThemeSettings.fromJson(Map<String, dynamic> json) =
      _$ThemeSettingsImpl.fromJson;

  @override
  bool get isDarkMode;
  @override
  bool get useSystemTheme;

  /// Create a copy of ThemeSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeSettingsImplCopyWith<_$ThemeSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
