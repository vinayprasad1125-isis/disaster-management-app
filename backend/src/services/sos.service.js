const prisma = require('../database/prisma');

class SOSService {
  async createSOS(firebaseUid, sosData) {
    const user = await prisma.user.findUnique({ where: { firebaseUid } });
    if (!user) throw new Error('User not found');

    return prisma.sOSRequest.create({
      data: {
        requesterId: user.id,
        latitude: sosData.latitude,
        longitude: sosData.longitude,
        priority: sosData.priority || 'HIGH',
      },
    });
  }

  async getActiveSOS() {
    return prisma.sOSRequest.findMany({
      where: { status: 'ACTIVE' },
      include: { requester: { select: { name: true, phone: true } } },
    });
  }

  async cancelSOS(sosId, firebaseUid) {
    return prisma.sOSRequest.update({
      where: { id: sosId },
      data: { status: 'CANCELLED' },
    });
  }
}
module.exports = new SOSService();
