const reportService = require('../services/report.service');
const { successResponse } = require('../utils/responseFormatter');

exports.createReport = async (req, res, next) => {
  try {
    const report = await reportService.createReport(req.user.uid, req.body);
    return successResponse(res, 'Report submitted successfully', { report }, 201);
  } catch (error) { next(error); }
};

exports.getReports = async (req, res, next) => {
  try {
    const reports = await reportService.getReports();
    return successResponse(res, 'Reports retrieved', { reports });
  } catch (error) { next(error); }
};
