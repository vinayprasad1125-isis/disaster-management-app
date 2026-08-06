// Map Service encapsulates external API calls to Google Maps
class MapService {
  async getSafeRoute(originLat, originLng, destLat, destLng) {
    // Mock implementation of Google Maps Directions API request
    // In production, we use axios to call Google Maps API and inject the process.env.GOOGLE_MAPS_API_KEY
    if (!process.env.GOOGLE_MAPS_API_KEY) {
      console.warn("Google Maps API Key is missing. Returning mock route.");
    }
    
    return {
      distance: '5.2 km',
      duration: '12 mins',
      safeLevel: 'High',
      polyline: 'mock_encoded_polyline_string',
    };
  }

  async reverseGeocode(lat, lng) {
    return { address: '123 Safe Street, Cityville' };
  }
}
module.exports = new MapService();
