const cron = require('node-cron');
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
