const prisma = require('../database/prisma');

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
