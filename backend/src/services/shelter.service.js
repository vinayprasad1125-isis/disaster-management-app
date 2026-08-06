const prisma = require('../database/prisma');

class ShelterService {
  async getNearbyShelters(lat, lng) {
    // Basic implementation (in production, use PostGIS or Haversine formula)
    return prisma.shelter.findMany({
      take: 20,
    });
  }

  async getShelterById(id) {
    return prisma.shelter.findUnique({ where: { id } });
  }
}
module.exports = new ShelterService();
