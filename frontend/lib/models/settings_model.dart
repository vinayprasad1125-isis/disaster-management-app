import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class Settings with _$Settings {
  const factory Settings({
    required String language,
    required bool notificationsEnabled,
    required String themeSettingsId,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
