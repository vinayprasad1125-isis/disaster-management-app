const mapService = require('../services/map.service');
const { successResponse } = require('../utils/responseFormatter');

exports.getRoute = async (req, res, next) => {
  try {
    const { originLat, originLng, destLat, destLng } = req.query;
    const route = await mapService.getSafeRoute(
      parseFloat(originLat), parseFloat(originLng),
      parseFloat(destLat), parseFloat(destLng)
    );
    return successResponse(res, 'Safe route generated', { route });
  } catch (error) { next(error); }
};
