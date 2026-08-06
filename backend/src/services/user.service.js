const prisma = require('../database/prisma');

class UserService {
  async getProfile(firebaseUid) {
    return prisma.user.findUnique({
      where: { firebaseUid },
      include: { emergencyContacts: true },
    });
  }

  async updateProfile(firebaseUid, data) {
    return prisma.user.update({
      where: { firebaseUid },
      data,
    });
  }

  async updateLocation(firebaseUid, currentLat, currentLng) {
    return prisma.user.update({
      where: { firebaseUid },
      data: { currentLat, currentLng },
    });
  }

  async addEmergencyContact(firebaseUid, contactData) {
    const user = await prisma.user.findUnique({ where: { firebaseUid } });
    if (!user) throw new Error('User not found');

    return prisma.emergencyContact.create({
      data: {
        userId: user.id,
        name: contactData.name,
        phone: contactData.phone,
        relation: contactData.relation,
      },
    });
  }
}
module.exports = new UserService();
