// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsImpl _$$SettingsImplFromJson(Map<String, dynamic> json) =>
    _$SettingsImpl(
      language: json['language'] as String,
      notificationsEnabled: json['notificationsEnabled'] as bool,
      themeSettingsId: json['themeSettingsId'] as String,
    );

Map<String, dynamic> _$$SettingsImplToJson(_$SettingsImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
      'notificationsEnabled': instance.notificationsEnabled,
      'themeSettingsId': instance.themeSettingsId,
    };
