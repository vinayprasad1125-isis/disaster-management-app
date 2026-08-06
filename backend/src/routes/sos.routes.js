const express = require('express');
const sosController = require('../controllers/sos.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.post('/', sosController.createSOS);
router.get('/', sosController.getActiveSOS);
router.delete('/:id', sosController.cancelSOS);

module.exports = router;
