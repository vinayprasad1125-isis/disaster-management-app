const logger = require('../utils/logger');
const { errorResponse } = require('../utils/responseFormatter');

const errorHandler = (err, req, res, next) => {
  logger.error(err.message, { stack: err.stack });

  if (err.name === 'ZodError') {
    return errorResponse(res, 'Validation Error', err.errors, 400);
  }

  // Handle Prisma Errors
  if (err.code && err.code.startsWith('P2')) {
    return errorResponse(res, 'Database Error', [err.message], 400);
  }

  const statusCode = err.statusCode || 500;
  const message = err.isOperational ? err.message : 'Internal Server Error';

  errorResponse(res, message, [], statusCode);
};

module.exports = errorHandler;
