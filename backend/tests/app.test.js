const request = require('supertest');
const app = require('../src/app');

describe('App Endpoints', () => {
  it('should return 404 for unknown endpoints', async () => {
    const res = await request(app).get('/api/v1/unknown');
    expect(res.statusCode).toEqual(404);
    expect(res.body.success).toBe(false);
  });
});
