import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  static const String apiKey = '6da89ac0ca56c08615d2054fcc72da46';

  // 🔹 Get weather using lat/lon
  Future<Weather> fetchWeather(double lat, double lon) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  // 🔹 Geocoding API (City → Lat/Lon)
  Future<Map<String, double>> getCoordinates(String city) async {
    final url = Uri.parse(
      'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return {'lat': data[0]['lat'], 'lon': data[0]['lon']};
    } else {
      throw Exception('Failed to fetch coordinates');
    }
  }

  // 🔹 City search (2-step API)
  Future<Weather> fetchWeatherByCity(String city) async {
    final coords = await getCoordinates(city);
    return fetchWeather(coords['lat']!, coords['lon']!);
  }
}
