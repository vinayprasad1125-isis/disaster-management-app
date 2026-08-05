import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_settings_model.freezed.dart';
part 'theme_settings_model.g.dart';

@freezed
class ThemeSettings with _$ThemeSettings {
  const factory ThemeSettings({
    required bool isDarkMode,
    required bool useSystemTheme,
  }) = _ThemeSettings;

  factory ThemeSettings.fromJson(Map<String, dynamic> json) =>
      _$ThemeSettingsFromJson(json);
}
