const sosService = require('../services/sos.service');
const { successResponse } = require('../utils/responseFormatter');

exports.createSOS = async (req, res, next) => {
  try {
    const sos = await sosService.createSOS(req.user.uid, req.body);
    return successResponse(res, 'SOS Alert Broadcasted!', { sos }, 201);
  } catch (error) { next(error); }
};

exports.getActiveSOS = async (req, res, next) => {
  try {
    const sosList = await sosService.getActiveSOS();
    return successResponse(res, 'Active SOS requests retrieved', { sosList });
  } catch (error) { next(error); }
};

exports.cancelSOS = async (req, res, next) => {
  try {
    const sos = await sosService.cancelSOS(req.params.id, req.user.uid);
    return successResponse(res, 'SOS Cancelled', { sos });
  } catch (error) { next(error); }
};
