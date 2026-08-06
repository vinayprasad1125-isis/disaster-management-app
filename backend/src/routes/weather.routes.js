const express = require('express');
const weatherController = require('../controllers/weather.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.get('/current', weatherController.getCurrentWeather);
router.get('/forecast', weatherController.getForecast);

module.exports = router;
