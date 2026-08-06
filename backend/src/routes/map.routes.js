const express = require('express');
const mapController = require('../controllers/map.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.get('/route', mapController.getRoute);

module.exports = router;
