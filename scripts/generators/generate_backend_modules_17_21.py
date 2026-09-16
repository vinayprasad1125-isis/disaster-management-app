import os

backend_dir = "backend"

# Ensure directories exist
directories = [
    "src/jobs",
    "src/socket"
]
for d in directories:
    os.makedirs(os.path.join(backend_dir, d), exist_ok=True)


# ==========================================
# MODULE 17: Weather Module
# ==========================================
weather_service = """class WeatherService {
  async getCurrentWeather(lat, lng) {
    if (!process.env.OPENWEATHER_API_KEY) {
      console.warn("OpenWeather API Key missing. Returning mock weather.");
    }
    return {
      temperature: 28,
      condition: 'Cloudy',
      alerts: ['Heavy rain expected in 2 hours'],
    };
  }

  async getForecast(lat, lng) {
    return [
      { day: 'Tomorrow', temp: 26, condition: 'Rain' },
      { day: 'Day After', temp: 29, condition: 'Clear' },
    ];
  }
}
module.exports = new WeatherService();
"""
with open(os.path.join(backend_dir, "src/services/weather.service.js"), "w") as f: f.write(weather_service)

weather_controller = """const weatherService = require('../services/weather.service');
const { successResponse } = require('../utils/responseFormatter');

exports.getCurrentWeather = async (req, res, next) => {
  try {
    const { lat, lng } = req.query;
    const weather = await weatherService.getCurrentWeather(parseFloat(lat), parseFloat(lng));
    return successResponse(res, 'Current weather retrieved', { weather });
  } catch (error) { next(error); }
};

exports.getForecast = async (req, res, next) => {
  try {
    const { lat, lng } = req.query;
    const forecast = await weatherService.getForecast(parseFloat(lat), parseFloat(lng));
    return successResponse(res, 'Weather forecast retrieved', { forecast });
  } catch (error) { next(error); }
};
"""
with open(os.path.join(backend_dir, "src/controllers/weather.controller.js"), "w") as f: f.write(weather_controller)

weather_routes = """const express = require('express');
const weatherController = require('../controllers/weather.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.get('/current', weatherController.getCurrentWeather);
router.get('/forecast', weatherController.getForecast);

module.exports = router;
"""
with open(os.path.join(backend_dir, "src/routes/weather.routes.js"), "w") as f: f.write(weather_routes)


# ==========================================
# MODULE 18: Background Jobs
# ==========================================
job_index = """const cron = require('node-cron');
const logger = require('../utils/logger');
const weatherJob = require('./weather.job');
const alertsJob = require('./alerts.job');
const sosJob = require('./sos.job');
const cleanupJob = require('./cleanup.job');
const analyticsJob = require('./analytics.job');

const startJobs = () => {
  logger.info('Starting all background cron jobs...');
  weatherJob.start();
  alertsJob.start();
  sosJob.start();
  cleanupJob.start();
  analyticsJob.start();
};

module.exports = { startJobs };
"""
with open(os.path.join(backend_dir, "src/jobs/index.js"), "w") as f: f.write(job_index)

job_template = """const cron = require('node-cron');
const logger = require('../utils/logger');

// Run every 30 minutes
const task = cron.schedule('*/30 * * * *', async () => {
  logger.info(`Running {JOB_NAME} Job...`);
  try {
    // Logic goes here
  } catch (error) {
    logger.error(`Error in {JOB_NAME} Job:`, error);
  }
}, {
  scheduled: false
});

module.exports = task;
"""
for job in ['weather', 'alerts', 'sos', 'cleanup', 'analytics']:
    with open(os.path.join(backend_dir, f"src/jobs/{job}.job.js"), "w") as f:
        f.write(job_template.replace("{JOB_NAME}", job.capitalize()))


# ==========================================
# MODULE 19: Notification Module
# ==========================================
notification_service = """const admin = require('../config/firebase');
const prisma = require('../database/prisma');

class NotificationService {
  async registerToken(firebaseUid, fcmToken) {
    return prisma.user.update({
      where: { firebaseUid },
      data: { fcmToken },
    });
  }

  async sendTargetedNotification(userId, title, body) {
    const user = await prisma.user.findUnique({ where: { id: userId } });
    if (!user || !user.fcmToken) return false;

    // Save notification to DB
    await prisma.notification.create({
      data: { userId, title, body },
    });

    try {
      await admin.messaging().send({
        token: user.fcmToken,
        notification: { title, body },
      });
      return true;
    } catch (e) {
      console.error('FCM Error:', e);
      return false;
    }
  }

  async broadcastNotification(title, body) {
    try {
      await admin.messaging().send({
        topic: 'all_users',
        notification: { title, body },
      });
      return true;
    } catch (e) {
      console.error('FCM Broadcast Error:', e);
      return false;
    }
  }
}
module.exports = new NotificationService();
"""
with open(os.path.join(backend_dir, "src/services/notification.service.js"), "w") as f: f.write(notification_service)

notification_controller = """const notificationService = require('../services/notification.service');
const { successResponse } = require('../utils/responseFormatter');

exports.registerToken = async (req, res, next) => {
  try {
    await notificationService.registerToken(req.user.uid, req.body.token);
    return successResponse(res, 'Device token registered successfully');
  } catch (error) { next(error); }
};

exports.sendNotification = async (req, res, next) => {
  try {
    const { userId, title, body } = req.body;
    await notificationService.sendTargetedNotification(userId, title, body);
    return successResponse(res, 'Notification sent');
  } catch (error) { next(error); }
};

exports.broadcastNotification = async (req, res, next) => {
  try {
    const { title, body } = req.body;
    await notificationService.broadcastNotification(title, body);
    return successResponse(res, 'Broadcast sent');
  } catch (error) { next(error); }
};
"""
with open(os.path.join(backend_dir, "src/controllers/notification.controller.js"), "w") as f: f.write(notification_controller)

notification_routes = """const express = require('express');
const notificationController = require('../controllers/notification.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.post('/register-token', notificationController.registerToken);
router.post('/send', notificationController.sendNotification);
router.post('/broadcast', notificationController.broadcastNotification);

module.exports = router;
"""
with open(os.path.join(backend_dir, "src/routes/notification.routes.js"), "w") as f: f.write(notification_routes)


# ==========================================
# MODULE 20: AI Module
# ==========================================
ai_service = """class AIService {
  async processEmergencyChat(message, history) {
    if (!process.env.OPENAI_API_KEY) {
      return { response: "I am a mock AI assistant. Please provide OpenAI keys to activate me. You said: " + message };
    }
    // Mocking OpenAI integration for now
    return { response: "This is a simulated AI response indicating safe shelter paths." };
  }
}
module.exports = new AIService();
"""
with open(os.path.join(backend_dir, "src/services/ai.service.js"), "w") as f: f.write(ai_service)

ai_controller = """const aiService = require('../services/ai.service');
const { successResponse } = require('../utils/responseFormatter');

exports.chat = async (req, res, next) => {
  try {
    const { message, history } = req.body;
    const response = await aiService.processEmergencyChat(message, history);
    return successResponse(res, 'AI processed successfully', response);
  } catch (error) { next(error); }
};
"""
with open(os.path.join(backend_dir, "src/controllers/ai.controller.js"), "w") as f: f.write(ai_controller)

ai_routes = """const express = require('express');
const aiController = require('../controllers/ai.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();
router.use(verifyToken);

router.post('/chat', aiController.chat);

module.exports = router;
"""
with open(os.path.join(backend_dir, "src/routes/ai.routes.js"), "w") as f: f.write(ai_routes)


# ==========================================
# MODULE 21: Socket.IO Integration
# ==========================================
socket_index = """const { Server } = require('socket.io');
const logger = require('../utils/logger');
const { handleSocketEvents } = require('./handlers');

let io;

const initializeSocket = (server) => {
  io = new Server(server, {
    cors: {
      origin: '*',
      methods: ['GET', 'POST'],
    },
  });

  // Mock Authentication Middleware
  io.use((socket, next) => {
    const token = socket.handshake.auth.token;
    if (!token) return next(new Error('Authentication error'));
    socket.user = { uid: 'mock_uid' }; // Verify Firebase Token here in production
    next();
  });

  io.on('connection', (socket) => {
    logger.info(`Socket connected: ${socket.id}`);
    handleSocketEvents(io, socket);
    
    socket.on('disconnect', () => {
      logger.info(`Socket disconnected: ${socket.id}`);
    });
  });

  return io;
};

const getIO = () => {
  if (!io) throw new Error('Socket.io not initialized!');
  return io;
};

module.exports = { initializeSocket, getIO };
"""
with open(os.path.join(backend_dir, "src/socket/index.js"), "w") as f: f.write(socket_index)

socket_handlers = """const logger = require('../utils/logger');

const handleSocketEvents = (io, socket) => {
  socket.on('location:update', (data) => {
    logger.info(`Location updated for user ${socket.user.uid}`);
    // Broadcast to rescue teams or friends
    io.emit('location:update', { userId: socket.user.uid, ...data });
  });

  socket.on('sos:create', (data) => {
    logger.info(`SOS created by user ${socket.user.uid}`);
    io.emit('sos:created', { userId: socket.user.uid, ...data });
  });

  socket.on('chat:message', (data) => {
    const { roomId, message } = data;
    socket.to(roomId).emit('chat:message', { sender: socket.user.uid, message });
  });

  socket.on('joinRoom', (roomId) => {
    socket.join(roomId);
  });
};

module.exports = { handleSocketEvents };
"""
with open(os.path.join(backend_dir, "src/socket/handlers.js"), "w") as f: f.write(socket_handlers)


# ==========================================
# UPDATE server.js & app.js
# ==========================================
# Need to update server.js to use socket and cron jobs
server_js_update = """require('dotenv').config();
const http = require('http');
const app = require('./app');
const { checkDatabaseConnection } = require('./config/database');
const logger = require('./utils/logger');
const { initializeSocket } = require('./socket');
const { startJobs } = require('./jobs');

const PORT = process.env.PORT || 3000;
const server = http.createServer(app);

// Initialize WebSockets
initializeSocket(server);

const startServer = async () => {
  // 1. Check DB Connection
  await checkDatabaseConnection();

  // 2. Start Background Jobs
  startJobs();

  // 3. Start Express Server
  server.listen(PORT, () => {
    logger.info(`🚀 Server running in ${process.env.NODE_ENV || 'development'} mode on port ${PORT}`);
  });
};

startServer();

// Graceful Shutdown
process.on('SIGTERM', () => {
  logger.info('SIGTERM signal received: closing HTTP server');
  server.close(() => {
    logger.info('HTTP server closed');
    process.exit(0);
  });
});
"""
with open(os.path.join(backend_dir, "src/server.js"), "w") as f: f.write(server_js_update)

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
const weatherRoutes = require('./routes/weather.routes');
const notificationRoutes = require('./routes/notification.routes');
const aiRoutes = require('./routes/ai.routes');

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
app.use('/api/v1/weather', weatherRoutes);
app.use('/api/v1/notifications', notificationRoutes);
app.use('/api/v1/ai', aiRoutes);

// 404 Handler
app.use((req, res, next) => {
  res.status(404).json({ success: false, message: 'API Endpoint Not Found' });
});

// Global Error Handler
app.use(errorHandler);

module.exports = app;
"""
with open(os.path.join(backend_dir, "src/app.js"), "w") as f: f.write(app_js_update)

print("Modules 17, 18, 19, 20, 21 successfully generated!")
