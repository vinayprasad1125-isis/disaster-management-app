const weatherService = require('../services/weather.service');
const { successResponse } = require('../utils/responseFormatter');

exports.getCurrentWeather = async (req, res, next) => {
  try {
    const { lat, lng } = req.query;
    const weather = await weatherService.getCurrentWeather(parseFloat(lat), parseFloat(lng));
    return successResponse(res, 'Current weather retrieved', { weather });
  } catch (error) { next(error); }
};

exports.getForecast = async (req, res, next) => {
  try {
    const { lat, lng } = req.query;
    const forecast = await weatherService.getForecast(parseFloat(lat), parseFloat(lng));
    return successResponse(res, 'Weather forecast retrieved', { forecast });
  } catch (error) { next(error); }
};
