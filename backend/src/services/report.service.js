const prisma = require('../database/prisma');

class ReportService {
  async createReport(firebaseUid, reportData) {
    const user = await prisma.user.findUnique({ where: { firebaseUid } });
    
    return prisma.disasterReport.create({
      data: {
        reporterId: user.id,
        type: reportData.type,
        description: reportData.description,
        severity: reportData.severity,
        latitude: reportData.latitude,
        longitude: reportData.longitude,
        images: reportData.images || [],
      },
    });
  }

  async getReports() {
    return prisma.disasterReport.findMany({
      orderBy: { createdAt: 'desc' },
      include: { reporter: { select: { name: true } } },
    });
  }
}
module.exports = new ReportService();
