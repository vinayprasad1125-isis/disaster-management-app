import os

backend_dir = "backend"

# ==========================================
# MODULE 12: User Module
# ==========================================
user_service = """const prisma = require('../database/prisma');

class UserService {
  async getProfile(firebaseUid) {
    return prisma.user.findUnique({
      where: { firebaseUid },
      include: { emergencyContacts: true },
    });
  }

  async updateProfile(firebaseUid, data) {
    return prisma.user.update({
      where: { firebaseUid },
      data,
    });
  }

  async updateLocation(firebaseUid, currentLat, currentLng) {
    return prisma.user.update({
      where: { firebaseUid },
      data: { currentLat, currentLng },
    });
  }

  async addEmergencyContact(firebaseUid, contactData) {
    const user = await prisma.user.findUnique({ where: { firebaseUid } });
    if (!user) throw new Error('User not found');

    return prisma.emergencyContact.create({
      data: {
        userId: user.id,
        name: contactData.name,
        phone: contactData.phone,
        relation: contactData.relation,
      },
    });
  }
}
module.exports = new UserService();
"""
with open(os.path.join(backend_dir, "src/services/user.service.js"), "w") as f: f.write(user_service)

user_controller = """const userService = require('../services/user.service');
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
"""
with open(os.path.join(backend_dir, "src/controllers/user.controller.js"), "w") as f: f.write(user_controller)

user_routes = """const express = require('express');
const userController = require('../controllers/user.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.get('/profile', userController.getProfile);
router.put('/profile', userController.updateProfile);
router.put('/location', userController.updateLocation);
router.post('/contacts', userController.addEmergencyContact);

module.exports = router;
"""
with open(os.path.join(backend_dir, "src/routes/user.routes.js"), "w") as f: f.write(user_routes)


# ==========================================
# MODULE 13: SOS Module
# ==========================================
sos_service = """const prisma = require('../database/prisma');

class SOSService {
  async createSOS(firebaseUid, sosData) {
    const user = await prisma.user.findUnique({ where: { firebaseUid } });
    if (!user) throw new Error('User not found');

    return prisma.sOSRequest.create({
      data: {
        requesterId: user.id,
        latitude: sosData.latitude,
        longitude: sosData.longitude,
        priority: sosData.priority || 'HIGH',
      },
    });
  }

  async getActiveSOS() {
    return prisma.sOSRequest.findMany({
      where: { status: 'ACTIVE' },
      include: { requester: { select: { name: true, phone: true } } },
    });
  }

  async cancelSOS(sosId, firebaseUid) {
    return prisma.sOSRequest.update({
      where: { id: sosId },
      data: { status: 'CANCELLED' },
    });
  }
}
module.exports = new SOSService();
"""
with open(os.path.join(backend_dir, "src/services/sos.service.js"), "w") as f: f.write(sos_service)

sos_controller = """const sosService = require('../services/sos.service');
const { successResponse } = require('../utils/responseFormatter');

exports.createSOS = async (req, res, next) => {
  try {
    const sos = await sosService.createSOS(req.user.uid, req.body);
    return successResponse(res, 'SOS Alert Broadcasted!', { sos }, 201);
  } catch (error) { next(error); }
};

exports.getActiveSOS = async (req, res, next) => {
  try {
    const sosList = await sosService.getActiveSOS();
    return successResponse(res, 'Active SOS requests retrieved', { sosList });
  } catch (error) { next(error); }
};

exports.cancelSOS = async (req, res, next) => {
  try {
    const sos = await sosService.cancelSOS(req.params.id, req.user.uid);
    return successResponse(res, 'SOS Cancelled', { sos });
  } catch (error) { next(error); }
};
"""
with open(os.path.join(backend_dir, "src/controllers/sos.controller.js"), "w") as f: f.write(sos_controller)

sos_routes = """const express = require('express');
const sosController = require('../controllers/sos.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.post('/', sosController.createSOS);
router.get('/', sosController.getActiveSOS);
router.delete('/:id', sosController.cancelSOS);

module.exports = router;
"""
with open(os.path.join(backend_dir, "src/routes/sos.routes.js"), "w") as f: f.write(sos_routes)


# ==========================================
# MODULE 14: Disaster Reporting Module
# ==========================================
report_service = """const prisma = require('../database/prisma');

class ReportService {
  async createReport(firebaseUid, reportData) {
    const user = await prisma.user.findUnique({ where: { firebaseUid } });
    
    return prisma.disasterReport.create({
      data: {
        reporterId: user.id,
        type: reportData.type,
        description: reportData.description,
        severity: reportData.severity,
        latitude: reportData.latitude,
        longitude: reportData.longitude,
        images: reportData.images || [],
      },
    });
  }

  async getReports() {
    return prisma.disasterReport.findMany({
      orderBy: { createdAt: 'desc' },
      include: { reporter: { select: { name: true } } },
    });
  }
}
module.exports = new ReportService();
"""
with open(os.path.join(backend_dir, "src/services/report.service.js"), "w") as f: f.write(report_service)

report_controller = """const reportService = require('../services/report.service');
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
"""
with open(os.path.join(backend_dir, "src/controllers/report.controller.js"), "w") as f: f.write(report_controller)

report_routes = """const express = require('express');
const reportController = require('../controllers/report.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.post('/', reportController.createReport);
router.get('/', reportController.getReports);

module.exports = router;
"""
with open(os.path.join(backend_dir, "src/routes/report.routes.js"), "w") as f: f.write(report_routes)


# ==========================================
# MODULE 15: Shelter Module
# ==========================================
shelter_service = """const prisma = require('../database/prisma');

class ShelterService {
  async getNearbyShelters(lat, lng) {
    // Basic implementation (in production, use PostGIS or Haversine formula)
    return prisma.shelter.findMany({
      take: 20,
    });
  }

  async getShelterById(id) {
    return prisma.shelter.findUnique({ where: { id } });
  }
}
module.exports = new ShelterService();
"""
with open(os.path.join(backend_dir, "src/services/shelter.service.js"), "w") as f: f.write(shelter_service)

shelter_controller = """const shelterService = require('../services/shelter.service');
const { successResponse } = require('../utils/responseFormatter');

exports.getNearbyShelters = async (req, res, next) => {
  try {
    const { lat, lng } = req.query;
    const shelters = await shelterService.getNearbyShelters(parseFloat(lat), parseFloat(lng));
    return successResponse(res, 'Nearby shelters retrieved', { shelters });
  } catch (error) { next(error); }
};
"""
with open(os.path.join(backend_dir, "src/controllers/shelter.controller.js"), "w") as f: f.write(shelter_controller)

shelter_routes = """const express = require('express');
const shelterController = require('../controllers/shelter.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.get('/nearby', shelterController.getNearbyShelters);

module.exports = router;
"""
with open(os.path.join(backend_dir, "src/routes/shelter.routes.js"), "w") as f: f.write(shelter_routes)


# ==========================================
# MODULE 16: Map Module
# ==========================================
map_service = """// Map Service encapsulates external API calls to Google Maps
class MapService {
  async getSafeRoute(originLat, originLng, destLat, destLng) {
    // Mock implementation of Google Maps Directions API request
    // In production, we use axios to call Google Maps API and inject the process.env.GOOGLE_MAPS_API_KEY
    if (!process.env.GOOGLE_MAPS_API_KEY) {
      console.warn("Google Maps API Key is missing. Returning mock route.");
    }
    
    return {
      distance: '5.2 km',
      duration: '12 mins',
      safeLevel: 'High',
      polyline: 'mock_encoded_polyline_string',
    };
  }

  async reverseGeocode(lat, lng) {
    return { address: '123 Safe Street, Cityville' };
  }
}
module.exports = new MapService();
"""
with open(os.path.join(backend_dir, "src/services/map.service.js"), "w") as f: f.write(map_service)

map_controller = """const mapService = require('../services/map.service');
const { successResponse } = require('../utils/responseFormatter');

exports.getRoute = async (req, res, next) => {
  try {
    const { originLat, originLng, destLat, destLng } = req.query;
    const route = await mapService.getSafeRoute(
      parseFloat(originLat), parseFloat(originLng),
      parseFloat(destLat), parseFloat(destLng)
    );
    return successResponse(res, 'Safe route generated', { route });
  } catch (error) { next(error); }
};
"""
with open(os.path.join(backend_dir, "src/controllers/map.controller.js"), "w") as f: f.write(map_controller)

map_routes = """const express = require('express');
const mapController = require('../controllers/map.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.get('/route', mapController.getRoute);

module.exports = router;
"""
with open(os.path.join(backend_dir, "src/routes/map.routes.js"), "w") as f: f.write(map_routes)

# ==========================================
# Update app.js to include all new routes
# ==========================================
app_js_update = """const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const { apiLimiter } = require('./middlewares/rateLimiter');
const errorHandler = require('./middlewares/errorHandler');
const logger = require('./utils/logger');

// Route Imports
const authRoutes = require('./routes/auth.routes');
const userRoutes = require('./routes/user.routes');
const sosRoutes = require('./routes/sos.routes');
const reportRoutes = require('./routes/report.routes');
const shelterRoutes = require('./routes/shelter.routes');
const mapRoutes = require('./routes/map.routes');

const app = express();

// Security Middleware
app.use(helmet());
app.use(cors());
app.use(apiLimiter);

// Parsing Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Request Logging Middleware
app.use((req, res, next) => {
  logger.info(`${req.method} ${req.originalUrl}`);
  next();
});

// API Routes
app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/users', userRoutes);
app.use('/api/v1/sos', sosRoutes);
app.use('/api/v1/reports', reportRoutes);
app.use('/api/v1/shelters', shelterRoutes);
app.use('/api/v1/maps', mapRoutes);

// 404 Handler
app.use((req, res, next) => {
  res.status(404).json({ success: false, message: 'API Endpoint Not Found' });
});

// Global Error Handler
app.use(errorHandler);

module.exports = app;
"""
with open(os.path.join(backend_dir, "src/app.js"), "w") as f:
    f.write(app_js_update)

print("Modules 12, 13, 14, 15, 16 successfully generated!")
