const notificationService = require('../services/notification.service');
const { successResponse } = require('../utils/responseFormatter');

exports.registerToken = async (req, res, next) => {
  try {
    await notificationService.registerToken(req.user.uid, req.body.token);
    return successResponse(res, 'Device token registered successfully');
  } catch (error) { next(error); }
};

exports.sendNotification = async (req, res, next) => {
  try {
    const { userId, title, body } = req.body;
    await notificationService.sendTargetedNotification(userId, title, body);
    return successResponse(res, 'Notification sent');
  } catch (error) { next(error); }
};

exports.broadcastNotification = async (req, res, next) => {
  try {
    const { title, body } = req.body;
    await notificationService.broadcastNotification(title, body);
    return successResponse(res, 'Broadcast sent');
  } catch (error) { next(error); }
};
