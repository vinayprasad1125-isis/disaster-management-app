# Disaster Management Backend

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
