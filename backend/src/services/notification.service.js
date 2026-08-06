const admin = require('../config/firebase');
const prisma = require('../database/prisma');

class NotificationService {
  async registerToken(firebaseUid, fcmToken) {
    return prisma.user.update({
      where: { firebaseUid },
      data: { fcmToken },
    });
  }

  async sendTargetedNotification(userId, title, body) {
    const user = await prisma.user.findUnique({ where: { id: userId } });
    if (!user || !user.fcmToken) return false;

    // Save notification to DB
    await prisma.notification.create({
      data: { userId, title, body },
    });

    try {
      await admin.messaging().send({
        token: user.fcmToken,
        notification: { title, body },
      });
      return true;
    } catch (e) {
      console.error('FCM Error:', e);
      return false;
    }
  }

  async broadcastNotification(title, body) {
    try {
      await admin.messaging().send({
        topic: 'all_users',
        notification: { title, body },
      });
      return true;
    } catch (e) {
      console.error('FCM Broadcast Error:', e);
      return false;
    }
  }
}
module.exports = new NotificationService();
