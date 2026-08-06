const cron = require('node-cron');
const logger = require('../utils/logger');

// Run every 30 minutes
const task = cron.schedule('*/30 * * * *', async () => {
  logger.info(`Running Alerts Job...`);
  try {
    // Logic goes here
  } catch (error) {
    logger.error(`Error in Alerts Job:`, error);
  }
}, {
  scheduled: false
});

module.exports = task;
