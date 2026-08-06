require('dotenv').config();
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
