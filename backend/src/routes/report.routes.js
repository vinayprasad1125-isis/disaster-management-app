const express = require('express');
const reportController = require('../controllers/report.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.post('/', reportController.createReport);
router.get('/', reportController.getReports);

module.exports = router;
