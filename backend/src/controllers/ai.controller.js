const aiService = require('../services/ai.service');
const { successResponse } = require('../utils/responseFormatter');

exports.chat = async (req, res, next) => {
  try {
    const { message, history } = req.body;
    const response = await aiService.processEmergencyChat(message, history);
    return successResponse(res, 'AI processed successfully', response);
  } catch (error) { next(error); }
};
