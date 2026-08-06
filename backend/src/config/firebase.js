const admin = require('firebase-admin');

// Ensure we don't crash if env vars are missing during development
if (process.env.FIREBASE_PROJECT_ID && process.env.FIREBASE_CLIENT_EMAIL && process.env.FIREBASE_PRIVATE_KEY) {
  admin.initializeApp({
    credential: admin.credential.cert({
      projectId: process.env.FIREBASE_PROJECT_ID,
      clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
      privateKey: process.env.FIREBASE_PRIVATE_KEY.replace(/\\n/g, '\n'),
    }),
  });
} else {
  console.warn('⚠️ FIREBASE ENV variables are missing. Firebase Admin not fully initialized.');
  // Mock initialize for passing tests
  admin.initializeApp();
}

module.exports = admin;
