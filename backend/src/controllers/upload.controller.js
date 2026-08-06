const { successResponse } = require('../utils/responseFormatter');

exports.uploadFiles = async (req, res, next) => {
  try {
    if (!req.files || req.files.length === 0) {
      return res.status(400).json({ success: false, message: 'No files uploaded' });
    }
    const filePaths = req.files.map(f => `/uploads/${f.filename}`);
    return successResponse(res, 'Files uploaded successfully', { filePaths });
  } catch (error) { next(error); }
};
