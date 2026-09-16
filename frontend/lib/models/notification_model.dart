import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String id,
    required String title,
    required String body,
    required bool isRead,
    required DateTime timestamp,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
