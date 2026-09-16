import os

backend_dir = "backend"

# Ensure directories exist
directories = [
    "prisma",
    "src/config",
    "src/middlewares",
    "src/utils",
    "src/routes",
    "src/controllers",
    "src/services"
]
for d in directories:
    os.makedirs(os.path.join(backend_dir, d), exist_ok=True)

# ==========================================
# MODULE 8: Seed Script
# ==========================================
seed_js = """const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  console.log('Seeding database...');
  // Dummy Admin User
  const admin = await prisma.user.upsert({
    where: { email: 'admin@disasterapp.com' },
    update: {},
    create: {
      email: 'admin@disasterapp.com',
      firebaseUid: 'admin_firebase_uid_mock',
      name: 'System Admin',
      role: 'ADMIN',
    },
  });
  console.log({ admin });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
"""
with open(os.path.join(backend_dir, "prisma/seed.js"), "w") as f:
    f.write(seed_js)


# ==========================================
# MODULE 10 (Part A): Utilities & Logger
# ==========================================
logger_js = """const winston = require('winston');

const logger = winston.createLogger({
  level: process.env.LOG_LEVEL || 'info',
  format: winston.format.combine(
    winston.format.timestamp({
      format: 'YYYY-MM-DD HH:mm:ss'
    }),
    winston.format.errors({ stack: true }),
    winston.format.splat(),
    winston.format.json()
  ),
  defaultMeta: { service: 'disaster-management-api' },
  transports: [
    new winston.transports.File({ filename: 'error.log', level: 'error' }),
    new winston.transports.File({ filename: 'combined.log' })
  ]
});

if (process.env.NODE_ENV !== 'production') {
  logger.add(new winston.transports.Console({
    format: winston.format.combine(
      winston.format.colorize(),
      winston.format.simple()
    )
  }));
}

module.exports = logger;
"""
with open(os.path.join(backend_dir, "src/utils/logger.js"), "w") as f:
    f.write(logger_js)

response_formatter_js = """exports.successResponse = (res, message, data = {}, statusCode = 200) => {
  return res.status(statusCode).json({
    success: true,
    message,
    data,
    timestamp: new Date().toISOString()
  });
};

exports.errorResponse = (res, message, errors = [], statusCode = 500) => {
  return res.status(statusCode).json({
    success: false,
    message,
    errors,
    timestamp: new Date().toISOString()
  });
};
"""
with open(os.path.join(backend_dir, "src/utils/responseFormatter.js"), "w") as f:
    f.write(response_formatter_js)


# ==========================================
# MODULE 10 (Part B): Middlewares
# ==========================================
error_handler_js = """const logger = require('../utils/logger');
const { errorResponse } = require('../utils/responseFormatter');

const errorHandler = (err, req, res, next) => {
  logger.error(err.message, { stack: err.stack });

  if (err.name === 'ZodError') {
    return errorResponse(res, 'Validation Error', err.errors, 400);
  }

  // Handle Prisma Errors
  if (err.code && err.code.startsWith('P2')) {
    return errorResponse(res, 'Database Error', [err.message], 400);
  }

  const statusCode = err.statusCode || 500;
  const message = err.isOperational ? err.message : 'Internal Server Error';

  errorResponse(res, message, [], statusCode);
};

module.exports = errorHandler;
"""
with open(os.path.join(backend_dir, "src/middlewares/errorHandler.js"), "w") as f:
    f.write(error_handler_js)

rate_limiter_js = """const rateLimit = require('express-rate-limit');

const apiLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // Limit each IP to 100 requests per `window`
  message: 'Too many requests from this IP, please try again after 15 minutes',
  standardHeaders: true,
  legacyHeaders: false,
});

module.exports = { apiLimiter };
"""
with open(os.path.join(backend_dir, "src/middlewares/rateLimiter.js"), "w") as f:
    f.write(rate_limiter_js)

# ==========================================
# MODULE 9: Express Application Setup
# ==========================================
app_js = """const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const { apiLimiter } = require('./middlewares/rateLimiter');
const errorHandler = require('./middlewares/errorHandler');
const logger = require('./utils/logger');

// Route Imports
const authRoutes = require('./routes/auth.routes');

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

// 404 Handler
app.use((req, res, next) => {
  res.status(404).json({ success: false, message: 'API Endpoint Not Found' });
});

// Global Error Handler
app.use(errorHandler);

module.exports = app;
"""
with open(os.path.join(backend_dir, "src/app.js"), "w") as f:
    f.write(app_js)

server_js = """require('dotenv').config();
const http = require('http');
const app = require('./app');
const { checkDatabaseConnection } = require('./config/database');
const logger = require('./utils/logger');

const PORT = process.env.PORT || 3000;
const server = http.createServer(app);

const startServer = async () => {
  // 1. Check DB Connection
  await checkDatabaseConnection();

  // 2. Start Express Server
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
with open(os.path.join(backend_dir, "src/server.js"), "w") as f:
    f.write(server_js)


# ==========================================
# MODULE 11: Authentication Module
# ==========================================
# Firebase config Mock (we don't have real keys yet, so we will use a mock service for now or init firebase admin safely)
firebase_js = """const admin = require('firebase-admin');

// Ensure we don't crash if env vars are missing during development
if (process.env.FIREBASE_PROJECT_ID && process.env.FIREBASE_CLIENT_EMAIL && process.env.FIREBASE_PRIVATE_KEY) {
  admin.initializeApp({
    credential: admin.credential.cert({
      projectId: process.env.FIREBASE_PROJECT_ID,
      clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
      privateKey: process.env.FIREBASE_PRIVATE_KEY.replace(/\\\\n/g, '\\n'),
    }),
  });
} else {
  console.warn('⚠️ FIREBASE ENV variables are missing. Firebase Admin not fully initialized.');
  // Mock initialize for passing tests
  admin.initializeApp();
}

module.exports = admin;
"""
with open(os.path.join(backend_dir, "src/config/firebase.js"), "w") as f:
    f.write(firebase_js)

auth_middleware_js = """const admin = require('../config/firebase');
const { errorResponse } = require('../utils/responseFormatter');

const verifyToken = async (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return errorResponse(res, 'Unauthorized - No Token Provided', [], 401);
  }

  const token = authHeader.split(' ')[1];

  try {
    // In production, this verifies with Firebase
    const decodedToken = await admin.auth().verifyIdToken(token);
    req.user = decodedToken;
    next();
  } catch (error) {
    return errorResponse(res, 'Unauthorized - Invalid Token', [error.message], 401);
  }
};

module.exports = { verifyToken };
"""
with open(os.path.join(backend_dir, "src/middlewares/auth.js"), "w") as f:
    f.write(auth_middleware_js)

auth_service_js = """const prisma = require('../database/prisma');

class AuthService {
  async registerUser(firebaseUid, email, name, role = 'CITIZEN') {
    // Check if user already exists
    const existingUser = await prisma.user.findUnique({ where: { firebaseUid } });
    if (existingUser) {
      throw new Error('User already exists in the database.');
    }

    // Create user in DB
    const user = await prisma.user.create({
      data: {
        firebaseUid,
        email,
        name,
        role,
      },
    });
    return user;
  }

  async loginUser(firebaseUid) {
    const user = await prisma.user.findUnique({ where: { firebaseUid } });
    if (!user) {
      throw new Error('User not found in database. Please register first.');
    }
    
    // In a real scenario, you might want to return custom JWT or just rely on Firebase JWT
    // Here we just return the user object as they are already authenticated via Firebase on the client
    return user;
  }
}

module.exports = new AuthService();
"""
with open(os.path.join(backend_dir, "src/services/auth.service.js"), "w") as f:
    f.write(auth_service_js)

auth_controller_js = """const authService = require('../services/auth.service');
const { successResponse, errorResponse } = require('../utils/responseFormatter');

exports.register = async (req, res, next) => {
  try {
    // req.user is populated by verifyToken middleware (Firebase decoded token)
    const { uid, email, name } = req.user;
    const { role } = req.body; // Optional role from body

    const user = await authService.registerUser(uid, email, name, role);
    return successResponse(res, 'User registered successfully.', { user }, 201);
  } catch (error) {
    next(error);
  }
};

exports.login = async (req, res, next) => {
  try {
    const { uid } = req.user;
    const user = await authService.loginUser(uid);
    return successResponse(res, 'User logged in successfully.', { user });
  } catch (error) {
    next(error);
  }
};
"""
with open(os.path.join(backend_dir, "src/controllers/auth.controller.js"), "w") as f:
    f.write(auth_controller_js)

auth_routes_js = """const express = require('express');
const authController = require('../controllers/auth.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();

// Both routes require a valid Firebase ID Token
router.post('/register', verifyToken, authController.register);
router.post('/login', verifyToken, authController.login);

module.exports = router;
"""
with open(os.path.join(backend_dir, "src/routes/auth.routes.js"), "w") as f:
    f.write(auth_routes_js)

print("Modules 8, 9, 10, 11 successfully generated!")
