const express = require('express');
const userController = require('../controllers/user.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.get('/profile', userController.getProfile);
router.put('/profile', userController.updateProfile);
router.put('/location', userController.updateLocation);
router.post('/contacts', userController.addEmergencyContact);

module.exports = router;
