const express = require('express');
const authController = require('../controllers/auth.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();

// Both routes require a valid Firebase ID Token
router.post('/register', verifyToken, authController.register);
router.post('/login', verifyToken, authController.login);

module.exports = router;
