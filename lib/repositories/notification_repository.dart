import '../models/notification_model.dart';

abstract class NotificationRepository {
  Future<List<Notification>> getNotifications(String userId);
  Future<void> markAsRead(String notificationId);
}
