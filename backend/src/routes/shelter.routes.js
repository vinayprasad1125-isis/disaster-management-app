const express = require('express');
const shelterController = require('../controllers/shelter.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.get('/nearby', shelterController.getNearbyShelters);

module.exports = router;
