const express = require('express');
const notificationController = require('../controllers/notification.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.post('/register-token', notificationController.registerToken);
router.post('/send', notificationController.sendNotification);
router.post('/broadcast', notificationController.broadcastNotification);

module.exports = router;
