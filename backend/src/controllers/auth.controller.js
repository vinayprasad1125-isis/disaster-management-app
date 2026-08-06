const authService = require('../services/auth.service');
const { successResponse, errorResponse } = require('../utils/responseFormatter');

exports.register = async (req, res, next) => {
  try {
    // req.user is populated by verifyToken middleware (Firebase decoded token)
    const { uid, email, name } = req.user;
    const { role } = req.body; // Optional role from body

    const user = await authService.registerUser(uid, email, name, role);
    return successResponse(res, 'User registered successfully.', { user }, 201);
  } catch (error) {
    next(error);
  }
};

exports.login = async (req, res, next) => {
  try {
    const { uid } = req.user;
    const user = await authService.loginUser(uid);
    return successResponse(res, 'User logged in successfully.', { user });
  } catch (error) {
    next(error);
  }
};
