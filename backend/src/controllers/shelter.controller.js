const shelterService = require('../services/shelter.service');
const { successResponse } = require('../utils/responseFormatter');

exports.getNearbyShelters = async (req, res, next) => {
  try {
    const { lat, lng } = req.query;
    const shelters = await shelterService.getNearbyShelters(parseFloat(lat), parseFloat(lng));
    return successResponse(res, 'Nearby shelters retrieved', { shelters });
  } catch (error) { next(error); }
};
