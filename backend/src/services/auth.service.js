const prisma = require('../database/prisma');

class AuthService {
  async registerUser(firebaseUid, email, name, role = 'CITIZEN') {
    // Check if user already exists
    const existingUser = await prisma.user.findUnique({ where: { firebaseUid } });
    if (existingUser) {
      throw new Error('User already exists in the database.');
    }

    // Create user in DB
    const user = await prisma.user.create({
      data: {
        firebaseUid,
        email,
        name,
        role,
      },
    });
    return user;
  }

  async loginUser(firebaseUid) {
    const user = await prisma.user.findUnique({ where: { firebaseUid } });
    if (!user) {
      throw new Error('User not found in database. Please register first.');
    }
    
    // In a real scenario, you might want to return custom JWT or just rely on Firebase JWT
    // Here we just return the user object as they are already authenticated via Firebase on the client
    return user;
  }
}

module.exports = new AuthService();
