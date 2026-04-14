import 'package:flutter/material.dart';
import 'weather_model.dart';
import 'weather_service.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Lab',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();

  Future<Weather>? _weatherFuture;

  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  // 🔹 Search by Lat/Lon
  void searchByCoordinates() {
    final lat = double.tryParse(latController.text);
    final lon = double.tryParse(lonController.text);

    if (lat != null && lon != null) {
      setState(() {
        _weatherFuture = _weatherService.fetchWeather(lat, lon);
      });
    }
  }

  // 🔹 Search by City (Geocoding)
  void searchByCity() {
    final city = cityController.text;

    if (city.isNotEmpty) {
      setState(() {
        _weatherFuture = _weatherService.fetchWeatherByCity(city);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _weatherFuture = _weatherService.fetchWeather(51.5074, -0.1278);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather Pro 🌤️"), centerTitle: true),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🔹 City Search
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  hintText: "Enter city (e.g. Lahore)",
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: searchByCity,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 🔹 Lat/Lon Inputs
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: latController,
                      decoration: const InputDecoration(
                        hintText: "Latitude",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: lonController,
                      decoration: const InputDecoration(
                        hintText: "Longitude",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: searchByCoordinates,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // 🔹 Weather Display
              Expanded(
                child: FutureBuilder<Weather>(
                  future: _weatherFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }

                    if (!snapshot.hasData) {
                      return const Center(child: Text("No data"));
                    }

                    final weather = snapshot.data!;

                    return Center(
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                weather.cityName,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // 🌤️ WEATHER ICON
                              Image.network(
                                'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                              ),

                              Text(
                                '${weather.temperature.toStringAsFixed(1)}°C',
                                style: const TextStyle(fontSize: 50),
                              ),

                              Text(
                                weather.description.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
