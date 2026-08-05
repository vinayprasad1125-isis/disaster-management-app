import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_model.freezed.dart';
part 'alert_model.g.dart';

@freezed
class Alert with _$Alert {
  const factory Alert({
    required String id,
    required String title,
    required String description,
    required String severity,
    required DateTime timestamp,
  }) = _Alert;

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
}
