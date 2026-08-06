const express = require('express');
const upload = require('../middlewares/upload');
const uploadController = require('../controllers/upload.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();

router.use(verifyToken);
router.post('/', upload.array('media', 5), uploadController.uploadFiles);

module.exports = router;
