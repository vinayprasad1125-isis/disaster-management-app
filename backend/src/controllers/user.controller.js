const userService = require('../services/user.service');
const { successResponse } = require('../utils/responseFormatter');

exports.getProfile = async (req, res, next) => {
  try {
    const profile = await userService.getProfile(req.user.uid);
    return successResponse(res, 'Profile retrieved', { profile });
  } catch (error) { next(error); }
};

exports.updateProfile = async (req, res, next) => {
  try {
    const updated = await userService.updateProfile(req.user.uid, req.body);
    return successResponse(res, 'Profile updated', { profile: updated });
  } catch (error) { next(error); }
};

exports.updateLocation = async (req, res, next) => {
  try {
    const { lat, lng } = req.body;
    await userService.updateLocation(req.user.uid, lat, lng);
    return successResponse(res, 'Location updated successfully');
  } catch (error) { next(error); }
};

exports.addEmergencyContact = async (req, res, next) => {
  try {
    const contact = await userService.addEmergencyContact(req.user.uid, req.body);
    return successResponse(res, 'Emergency contact added', { contact }, 201);
  } catch (error) { next(error); }
};
