import 'dart:io';

void main() async {
  final dir = Directory('frontend/lib/models');
  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }

  final models = {
    'user_model': ['id', 'email', 'name', 'token'],
    'profile_model': ['userId', 'phoneNumber', 'bloodGroup', 'address'],
    'emergency_contact_model': ['id', 'name', 'phone', 'relationship'],
    'weather_model': ['temperature', 'condition', 'humidity', 'windSpeed'],
    'weather_forecast_model': ['date', 'temperature', 'condition'],
    'alert_model': ['id', 'title', 'description', 'severity', 'timestamp'],
    'government_alert_model': [
      'id',
      'title',
      'description',
      'source',
      'timestamp',
    ],
    'notification_model': ['id', 'title', 'body', 'isRead', 'timestamp'],
    'disaster_risk_model': ['level', 'description', 'affectedAreas'],
    'disaster_report_model': [
      'id',
      'type',
      'description',
      'severity',
      'locationId',
      'timestamp',
    ],
    'sos_model': ['id', 'userId', 'locationId', 'timestamp', 'status'],
    'shelter_model': [
      'id',
      'name',
      'address',
      'capacity',
      'availableBeds',
      'locationId',
    ],
    'volunteer_model': ['id', 'name', 'skills', 'availability', 'locationId'],
    'relief_center_model': ['id', 'name', 'resources', 'locationId'],
    'hospital_model': ['id', 'name', 'address', 'phone', 'locationId'],
    'police_station_model': ['id', 'name', 'address', 'phone', 'locationId'],
    'fire_station_model': ['id', 'name', 'address', 'phone', 'locationId'],
    'location_model': ['latitude', 'longitude', 'address'],
    'route_step_model': ['instruction', 'distance', 'duration'],
    'route_model': ['distance', 'duration', 'steps'],
    'map_marker_model': ['id', 'title', 'type', 'locationId'],
    'ai_message_model': ['id', 'text', 'isUser', 'timestamp'],
    'chat_message_model': ['id', 'senderId', 'text', 'timestamp'],
    'offline_guide_model': ['id', 'title', 'content', 'category'],
    'theme_settings_model': ['isDarkMode', 'useSystemTheme'],
    'settings_model': ['language', 'notificationsEnabled', 'themeSettingsId'],
    'report_attachment_model': ['id', 'url', 'type'],
  };

  for (final entry in models.entries) {
    final fileName = '${entry.key}.dart';
    final className = entry.key
        .split('_')
        .map((word) => word.substring(0, 1).toUpperCase() + word.substring(1))
        .join('')
        .replaceAll('Model', '');

    // We append Model to the class name as it is good practice, or just use the name directly.
    final finalClassName = className;

    final fields = entry.value
        .map((field) {
          if (field == 'latitude' ||
              field == 'longitude' ||
              field == 'temperature' ||
              field == 'humidity' ||
              field == 'windSpeed') {
            return '    required double $field,';
          } else if (field == 'isRead' ||
              field == 'isUser' ||
              field == 'isDarkMode' ||
              field == 'useSystemTheme' ||
              field == 'notificationsEnabled') {
            return '    required bool $field,';
          } else if (field == 'capacity' || field == 'availableBeds') {
            return '    required int $field,';
          } else if (field == 'timestamp' || field == 'date') {
            return '    required DateTime $field,';
          } else if (field == 'steps') {
            return '    required List<RouteStep> $field,';
          } else if (field == 'skills' ||
              field == 'affectedAreas' ||
              field == 'resources') {
            return '    required List<String> $field,';
          } else {
            return '    required String $field,';
          }
        })
        .join('\n');

    String imports =
        "import 'package:freezed_annotation/freezed_annotation.dart';\n\npart '${entry.key}.freezed.dart';\npart '${entry.key}.g.dart';\n";
    if (entry.key == 'route_model') {
      imports =
          "import 'package:freezed_annotation/freezed_annotation.dart';\nimport 'route_step_model.dart';\n\npart '${entry.key}.freezed.dart';\npart '${entry.key}.g.dart';\n";
    }

    final content =
        '''
$imports
@freezed
class $finalClassName with _\$$finalClassName {
  const factory $finalClassName({
$fields
  }) = _$finalClassName;

  factory $finalClassName.fromJson(Map<String, dynamic> json) => _\$${finalClassName}FromJson(json);
}
''';

    final file = File('frontend/lib/models/$fileName');
    await file.writeAsString(content);
  }
}
