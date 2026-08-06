const logger = require('../utils/logger');

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
