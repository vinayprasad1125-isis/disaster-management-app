import os

backend_dir = "backend"

# Ensure directories exist
directories = [
    "src/middlewares",
    "src/controllers",
    "src/routes",
    "src/uploads",
    "docs",
    "tests"
]
for d in directories:
    os.makedirs(os.path.join(backend_dir, d), exist_ok=True)

# ==========================================
# MODULE 22: File Upload Module
# ==========================================
multer_js = """const multer = require('multer');
const path = require('path');
const crypto = require('crypto');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, '../../uploads'));
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = crypto.randomBytes(8).toString('hex');
    const ext = path.extname(file.originalname);
    cb(null, `${file.fieldname}-${uniqueSuffix}${ext}`);
  },
});

const fileFilter = (req, file, cb) => {
  const allowedTypes = ['image/jpeg', 'image/png', 'video/mp4'];
  if (allowedTypes.includes(file.mimetype)) {
    cb(null, true);
  } else {
    cb(new Error('Invalid file type. Only JPEG, PNG, and MP4 are allowed.'), false);
  }
};

const upload = multer({ 
  storage, 
  fileFilter,
  limits: { fileSize: 10 * 1024 * 1024 }, // 10MB limit
});

module.exports = upload;
"""
with open(os.path.join(backend_dir, "src/middlewares/upload.js"), "w") as f: f.write(multer_js)

upload_controller = """const { successResponse } = require('../utils/responseFormatter');

exports.uploadFiles = async (req, res, next) => {
  try {
    if (!req.files || req.files.length === 0) {
      return res.status(400).json({ success: false, message: 'No files uploaded' });
    }
    const filePaths = req.files.map(f => `/uploads/${f.filename}`);
    return successResponse(res, 'Files uploaded successfully', { filePaths });
  } catch (error) { next(error); }
};
"""
with open(os.path.join(backend_dir, "src/controllers/upload.controller.js"), "w") as f: f.write(upload_controller)

upload_routes = """const express = require('express');
const upload = require('../middlewares/upload');
const uploadController = require('../controllers/upload.controller');
const { verifyToken } = require('../middlewares/auth');

const router = express.Router();

router.use(verifyToken);
router.post('/', upload.array('media', 5), uploadController.uploadFiles);

module.exports = router;
"""
with open(os.path.join(backend_dir, "src/routes/upload.routes.js"), "w") as f: f.write(upload_routes)

# Update app.js to serve static uploads and add upload route
app_js_update = """const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const path = require('path');
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
const uploadRoutes = require('./routes/upload.routes');

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
"""
with open(os.path.join(backend_dir, "src/app.js"), "w") as f: f.write(app_js_update)


# ==========================================
# MODULE 23: API Documentation
# ==========================================
swagger_json = """{
  "openapi": "3.0.0",
  "info": {
    "title": "Disaster Management API",
    "version": "1.0.0",
    "description": "Production API for Disaster Management Application"
  },
  "servers": [
    {
      "url": "http://localhost:3000/api/v1",
      "description": "Local server"
    }
  ],
  "paths": {
    "/auth/register": {
      "post": {
        "summary": "Register a new user",
        "responses": {
          "201": { "description": "User created" }
        }
      }
    }
  }
}
"""
with open(os.path.join(backend_dir, "docs/swagger.json"), "w") as f: f.write(swagger_json)


# ==========================================
# MODULE 24: Testing
# ==========================================
jest_config = """module.exports = {
  testEnvironment: 'node',
  verbose: true,
  clearMocks: true,
  coverageDirectory: 'coverage',
};
"""
with open(os.path.join(backend_dir, "jest.config.js"), "w") as f: f.write(jest_config)

app_test = """const request = require('supertest');
const app = require('../src/app');

describe('App Endpoints', () => {
  it('should return 404 for unknown endpoints', async () => {
    const res = await request(app).get('/api/v1/unknown');
    expect(res.statusCode).toEqual(404);
    expect(res.body.success).toBe(false);
  });
});
"""
with open(os.path.join(backend_dir, "tests/app.test.js"), "w") as f: f.write(app_test)


# ==========================================
# MODULE 25: Docker & Deployment
# ==========================================
dockerfile = """FROM node:20-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install --production

# Bundle app source
COPY . .

# Generate Prisma Client
RUN npx prisma generate

EXPOSE 3000
CMD [ "npm", "start" ]
"""
with open(os.path.join(backend_dir, "Dockerfile"), "w") as f: f.write(dockerfile)

dockerignore = """node_modules
npm-debug.log
.env
.DS_Store
coverage
uploads
"""
with open(os.path.join(backend_dir, ".dockerignore"), "w") as f: f.write(dockerignore)

docker_compose = """version: '3.8'

services:
  api:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
      - DATABASE_URL=postgresql://user:password@postgres:5432/disaster_db?schema=public
    depends_on:
      - postgres
    volumes:
      - ./uploads:/usr/src/app/uploads

  postgres:
    image: postgres:15-alpine
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
      POSTGRES_DB: disaster_db
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
"""
with open(os.path.join(backend_dir, "docker-compose.yml"), "w") as f: f.write(docker_compose)


# ==========================================
# MODULE 26: README
# ==========================================
readme = """# Disaster Management Backend

This is the production-ready Node.js, Express, PostgreSQL, and Prisma backend for the Disaster Management Application.

## Tech Stack
- **Runtime:** Node.js
- **Framework:** Express.js
- **Database:** PostgreSQL
- **ORM:** Prisma
- **Auth:** Firebase Admin SDK
- **Realtime:** Socket.IO

## Getting Started Locally

1. **Install Dependencies:**
   ```bash
   npm install
   ```
2. **Setup Environment Variables:**
   Copy `.env.example` to `.env` and fill in your keys (OpenAI, Google Maps, Firebase, Postgres).
3. **Run Database via Docker:**
   ```bash
   docker-compose up -d postgres
   ```
4. **Run Prisma Migrations & Seed:**
   ```bash
   npx prisma migrate dev
   npm run prisma:seed
   ```
5. **Start Server:**
   ```bash
   npm run dev
   ```

## Docker Deployment
To run the entire stack (Database + API) in production mode via Docker:
```bash
docker-compose up --build -d
```
"""
with open(os.path.join(backend_dir, "README.md"), "w") as f: f.write(readme)

print("Modules 22, 23, 24, 25, 26 successfully generated!")
