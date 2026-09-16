const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const path = require('path');
const { apiLimiter } = require('./middlewares/rateLimiter');
const errorHandler = require('./middlewares/errorHandler');
const logger = require('./utils/logger');

// Route Imports
const authRoutes = require('./modules/auth/auth.routes');
const userRoutes = require('./modules/users/users.routes');
const sosRoutes = require('./modules/sos/sos.routes');
const reportRoutes = require('./modules/reports/reports.routes');
const shelterRoutes = require('./modules/shelters/shelters.routes');
const mapRoutes = require('./modules/maps/maps.routes');
const weatherRoutes = require('./modules/weather/weather.routes');
const notificationRoutes = require('./modules/notifications/notifications.routes');
const aiRoutes = require('./modules/ai/ai.routes');
const uploadRoutes = require('./modules/upload/upload.routes');

const app = express();

// Security Middleware (Disable Cross-Origin-Resource-Policy for local image serving)
app.use(helmet({ crossOriginResourcePolicy: false }));
app.use(cors());
app.use(apiLimiter);

// Parsing Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve Static Uploads
app.use('/uploads', express.static(path.join(__dirname, '../uploads')));

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
app.use('/api/v1/upload', uploadRoutes);

// 404 Handler
app.use((req, res, next) => {
  res.status(404).json({ success: false, message: 'API Endpoint Not Found' });
});

// Global Error Handler
app.use(errorHandler);

module.exports = app;
