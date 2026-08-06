import os
import json

backend_dir = "backend"

# ==========================================
# MODULE 2: package.json
# ==========================================
package_json = {
  "name": "dstsr-mgmnt-backend",
  "version": "1.0.0",
  "description": "Production-ready backend for Disaster Management App",
  "main": "src/server.js",
  "scripts": {
    "start": "node src/server.js",
    "dev": "nodemon src/server.js",
    "prisma:generate": "prisma generate",
    "prisma:migrate": "prisma migrate dev",
    "prisma:seed": "node prisma/seed.js"
  },
  "dependencies": {
    "@prisma/client": "^5.15.0",
    "cors": "^2.8.5",
    "dotenv": "^16.4.5",
    "express": "^4.19.2",
    "express-rate-limit": "^7.3.1",
    "firebase-admin": "^12.2.0",
    "helmet": "^7.1.0",
    "multer": "^1.4.5-lts.1",
    "node-cron": "^3.0.3",
    "socket.io": "^4.7.5",
    "uuid": "^10.0.0",
    "winston": "^3.13.0",
    "zod": "^3.23.8"
  },
  "devDependencies": {
    "nodemon": "^3.1.4",
    "prisma": "^5.15.0"
  }
}

with open(os.path.join(backend_dir, "package.json"), "w") as f:
    json.dump(package_json, f, indent=2)

# ==========================================
# MODULE 3: .env.example
# ==========================================
env_example = """DATABASE_URL="postgresql://user:password@localhost:5432/disaster_db?schema=public"
PORT=3000
NODE_ENV=development
JWT_SECRET=your_super_secret_jwt_key

OPENAI_API_KEY=sk-your-openai-api-key
GOOGLE_MAPS_API_KEY=your_google_maps_api_key
OPENWEATHER_API_KEY=your_openweather_api_key

FIREBASE_PROJECT_ID=your_firebase_project_id
FIREBASE_CLIENT_EMAIL=your_firebase_client_email
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\\nYourPrivateKeyHere\\n-----END PRIVATE KEY-----\\n"

FCM_PROJECT_ID=your_fcm_project_id
FCM_CLIENT_EMAIL=your_fcm_client_email
FCM_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\\nYourPrivateKeyHere\\n-----END PRIVATE KEY-----\\n"

LOG_LEVEL=info
"""

with open(os.path.join(backend_dir, ".env.example"), "w") as f:
    f.write(env_example)

with open(os.path.join(backend_dir, ".env"), "w") as f:
    f.write(env_example)

# ==========================================
# MODULE 4: Prisma Schema
# ==========================================
schema_prisma = """generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

// ENUMS
enum Role {
  CITIZEN
  VOLUNTEER
  ADMIN
}

enum DisasterType {
  FLOOD
  EARTHQUAKE
  CYCLONE
  LANDSLIDE
  WILDFIRE
  FIRE
  ROAD_BLOCK
  COLLAPSED_BUILDING
  POWER_OUTAGE
}

enum ReportStatus {
  PENDING
  VERIFIED
  REJECTED
}

enum SOSPriority {
  LOW
  MEDIUM
  HIGH
  CRITICAL
}

enum SOSStatus {
  ACTIVE
  ASSIGNED
  RESOLVED
  CANCELLED
}

// MODELS
model User {
  id             String   @id @default(uuid())
  firebaseUid    String   @unique
  email          String   @unique
  name           String?
  role           Role     @default(CITIZEN)
  phone          String?
  profileImage   String?
  fcmToken       String?
  isActive       Boolean  @default(true)
  isGuest        Boolean  @default(false)
  currentLat     Float?
  currentLng     Float?
  createdAt      DateTime @default(now())
  updatedAt      DateTime @updatedAt
  
  // Relations
  emergencyContacts EmergencyContact[]
  reports          DisasterReport[]
  sosRequests      SOSRequest[]
  notifications    Notification[]
  chatMessages     ChatMessage[]
  volunteerRequests VolunteerRequest[]
  assignedSOS      SOSRequest[] @relation("RescueTeamToSOS")
}

model EmergencyContact {
  id        String   @id @default(uuid())
  userId    String
  name      String
  phone     String
  relation  String?
  createdAt DateTime @default(now())
  
  user      User     @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@index([userId])
}

model DisasterReport {
  id            String       @id @default(uuid())
  reporterId    String
  type          DisasterType
  description   String
  severity      Int          // 1 to 5
  latitude      Float
  longitude     Float
  status        ReportStatus @default(PENDING)
  images        String[]
  videos        String[]
  createdAt     DateTime     @default(now())
  updatedAt     DateTime     @updatedAt

  reporter      User         @relation(fields: [reporterId], references: [id], onDelete: Cascade)

  @@index([latitude, longitude])
  @@index([reporterId])
}

model SOSRequest {
  id               String      @id @default(uuid())
  requesterId      String
  latitude         Float
  longitude        Float
  priority         SOSPriority @default(HIGH)
  status           SOSStatus   @default(ACTIVE)
  rescueTeamId     String?
  estimatedTimeMins Int?
  createdAt        DateTime    @default(now())
  updatedAt        DateTime    @updatedAt

  requester        User        @relation(fields: [requesterId], references: [id], onDelete: Cascade)
  rescueTeam       User?       @relation("RescueTeamToSOS", fields: [rescueTeamId], references: [id], onDelete: SetNull)

  @@index([latitude, longitude])
  @@index([status])
}

model Shelter {
  id               String   @id @default(uuid())
  name             String
  latitude         Float
  longitude        Float
  capacity         Int
  currentOccupancy Int      @default(0)
  hasMedical       Boolean  @default(false)
  hasFood          Boolean  @default(false)
  hasWater         Boolean  @default(false)
  contactPhone     String?
  createdAt        DateTime @default(now())
  updatedAt        DateTime @updatedAt

  @@index([latitude, longitude])
}

model Hospital {
  id               String   @id @default(uuid())
  name             String
  latitude         Float
  longitude        Float
  capacity         Int
  availableBeds    Int
  contactPhone     String?
  createdAt        DateTime @default(now())
  updatedAt        DateTime @updatedAt

  @@index([latitude, longitude])
}

model PoliceStation {
  id               String   @id @default(uuid())
  name             String
  latitude         Float
  longitude        Float
  contactPhone     String?
  createdAt        DateTime @default(now())
  updatedAt        DateTime @updatedAt

  @@index([latitude, longitude])
}

model ReliefCenter {
  id               String   @id @default(uuid())
  name             String
  latitude         Float
  longitude        Float
  foodAvailable    Boolean  @default(true)
  waterAvailable   Boolean  @default(true)
  medicineAvailable Boolean @default(true)
  contactPhone     String?
  createdAt        DateTime @default(now())
  updatedAt        DateTime @updatedAt

  @@index([latitude, longitude])
}

model GovernmentAlert {
  id          String   @id @default(uuid())
  title       String
  description String
  source      String
  severity    String
  expiresAt   DateTime?
  createdAt   DateTime @default(now())
}

model WeatherAlert {
  id          String   @id @default(uuid())
  type        String
  description String
  severity    String
  latitude    Float?
  longitude   Float?
  createdAt   DateTime @default(now())

  @@index([latitude, longitude])
}

model Notification {
  id        String   @id @default(uuid())
  userId    String
  title     String
  body      String
  isRead    Boolean  @default(false)
  createdAt DateTime @default(now())

  user      User     @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@index([userId, isRead])
}

model ChatMessage {
  id        String   @id @default(uuid())
  senderId  String
  roomId    String
  text      String
  createdAt DateTime @default(now())

  sender    User     @relation(fields: [senderId], references: [id], onDelete: Cascade)

  @@index([roomId])
}

model VolunteerRequest {
  id          String   @id @default(uuid())
  userId      String
  skills      String[]
  status      String   @default("PENDING")
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt

  user        User     @relation(fields: [userId], references: [id], onDelete: Cascade)
}
"""

with open(os.path.join(backend_dir, "prisma/schema.prisma"), "w") as f:
    f.write(schema_prisma)

# ==========================================
# MODULE 5: Prisma Client Setup
# ==========================================
prisma_client_setup = """const { PrismaClient } = require('@prisma/client');

// Use a global variable to prevent multiple instances during dev hot-reloads
const globalForPrisma = global;

const prisma = globalForPrisma.prisma || new PrismaClient({
  log: process.env.NODE_ENV === 'development' ? ['query', 'info', 'warn', 'error'] : ['error'],
});

if (process.env.NODE_ENV !== 'production') {
  globalForPrisma.prisma = prisma;
}

module.exports = prisma;
"""

with open(os.path.join(backend_dir, "src/database/prisma.ts"), "w") as f:
    f.write(prisma_client_setup)

with open(os.path.join(backend_dir, "src/database/prisma.js"), "w") as f:
    f.write(prisma_client_setup)


# ==========================================
# MODULE 6: Database Configuration
# ==========================================
database_config = """const prisma = require('../database/prisma');

const checkDatabaseConnection = async () => {
  try {
    await prisma.$connect();
    console.log('✅ Successfully connected to the PostgreSQL database via Prisma.');
  } catch (error) {
    console.error('❌ Failed to connect to the database:', error);
    process.exit(1); // Exit process with failure
  }
};

const disconnectDatabase = async () => {
  try {
    await prisma.$disconnect();
    console.log('🛑 Disconnected from the database.');
  } catch (error) {
    console.error('❌ Error disconnecting from database:', error);
  }
};

module.exports = {
  checkDatabaseConnection,
  disconnectDatabase,
};
"""

with open(os.path.join(backend_dir, "src/config/database.js"), "w") as f:
    f.write(database_config)

print("Modules 2, 3, 4, 5, 6 successfully generated!")
