// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return _Settings.fromJson(json);
}

/// @nodoc
mixin _$Settings {
  String get language => throw _privateConstructorUsedError;
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  String get themeSettingsId => throw _privateConstructorUsedError;

  /// Serializes this Settings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res, Settings>;
  @useResult
  $Res call({
    String language,
    bool notificationsEnabled,
    String themeSettingsId,
  });
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res, $Val extends Settings>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? notificationsEnabled = null,
    Object? themeSettingsId = null,
  }) {
    return _then(
      _value.copyWith(
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            notificationsEnabled: null == notificationsEnabled
                ? _value.notificationsEnabled
                : notificationsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            themeSettingsId: null == themeSettingsId
                ? _value.themeSettingsId
                : themeSettingsId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SettingsImplCopyWith<$Res>
    implements $SettingsCopyWith<$Res> {
  factory _$$SettingsImplCopyWith(
    _$SettingsImpl value,
    $Res Function(_$SettingsImpl) then,
  ) = __$$SettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String language,
    bool notificationsEnabled,
    String themeSettingsId,
  });
}

/// @nodoc
class __$$SettingsImplCopyWithImpl<$Res>
    extends _$SettingsCopyWithImpl<$Res, _$SettingsImpl>
    implements _$$SettingsImplCopyWith<$Res> {
  __$$SettingsImplCopyWithImpl(
    _$SettingsImpl _value,
    $Res Function(_$SettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? notificationsEnabled = null,
    Object? themeSettingsId = null,
  }) {
    return _then(
      _$SettingsImpl(
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        notificationsEnabled: null == notificationsEnabled
            ? _value.notificationsEnabled
            : notificationsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        themeSettingsId: null == themeSettingsId
            ? _value.themeSettingsId
            : themeSettingsId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsImpl implements _Settings {
  const _$SettingsImpl({
    required this.language,
    required this.notificationsEnabled,
    required this.themeSettingsId,
  });

  factory _$SettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsImplFromJson(json);

  @override
  final String language;
  @override
  final bool notificationsEnabled;
  @override
  final String themeSettingsId;

  @override
  String toString() {
    return 'Settings(language: $language, notificationsEnabled: $notificationsEnabled, themeSettingsId: $themeSettingsId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.themeSettingsId, themeSettingsId) ||
                other.themeSettingsId == themeSettingsId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, language, notificationsEnabled, themeSettingsId);

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsImplCopyWith<_$SettingsImpl> get copyWith =>
      __$$SettingsImplCopyWithImpl<_$SettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsImplToJson(this);
  }
}

abstract class _Settings implements Settings {
  const factory _Settings({
    required final String language,
    required final bool notificationsEnabled,
    required final String themeSettingsId,
  }) = _$SettingsImpl;

  factory _Settings.fromJson(Map<String, dynamic> json) =
      _$SettingsImpl.fromJson;

  @override
  String get language;
  @override
  bool get notificationsEnabled;
  @override
  String get themeSettingsId;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsImplCopyWith<_$SettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
