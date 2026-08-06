const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  console.log('Seeding database...');
  // Dummy Admin User
  const admin = await prisma.user.upsert({
    where: { email: 'admin@disasterapp.com' },
    update: {},
    create: {
      email: 'admin@disasterapp.com',
      firebaseUid: 'admin_firebase_uid_mock',
      name: 'System Admin',
      role: 'ADMIN',
    },
  });
  console.log({ admin });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
