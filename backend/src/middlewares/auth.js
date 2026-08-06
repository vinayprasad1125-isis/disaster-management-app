const admin = require('../config/firebase');
const { errorResponse } = require('../utils/responseFormatter');

const verifyToken = async (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return errorResponse(res, 'Unauthorized - No Token Provided', [], 401);
  }

  const token = authHeader.split(' ')[1];

  try {
    // In production, this verifies with Firebase
    const decodedToken = await admin.auth().verifyIdToken(token);
    req.user = decodedToken;
    next();
  } catch (error) {
    return errorResponse(res, 'Unauthorized - Invalid Token', [error.message], 401);
  }
};

module.exports = { verifyToken };
