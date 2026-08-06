class WeatherService {
  async getCurrentWeather(lat, lng) {
    if (!process.env.OPENWEATHER_API_KEY) {
      console.warn("OpenWeather API Key missing. Returning mock weather.");
    }
    return {
      temperature: 28,
      condition: 'Cloudy',
      alerts: ['Heavy rain expected in 2 hours'],
    };
  }

  async getForecast(lat, lng) {
    return [
      { day: 'Tomorrow', temp: 26, condition: 'Rain' },
      { day: 'Day After', temp: 29, condition: 'Clear' },
    ];
  }
}
module.exports = new WeatherService();
