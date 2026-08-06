import '../notification_repository.dart';
import '../../models/notification_model.dart';

class ApiNotificationRepository implements NotificationRepository {
  @override
  Future<List<Notification>> getNotifications(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Notification(
        id: 'n1',
        title: 'Safety Check',
        body: 'Please mark yourself as safe.',
        isRead: false,
        timestamp: DateTime.now(),
      ),
      Notification(
        id: 'n2',
        title: 'New Shelter Opened',
        body: 'A new relief shelter has opened near you.',
        isRead: true,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
