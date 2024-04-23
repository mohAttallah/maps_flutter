import 'package:flutter/material.dart';
import 'package:maps/models/weather_model.dart';
import "../services/wheather_service.dart";

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key from openweathermap.org
  final _weatherService = WeatherService('YOUR_API_KEY');
  Weather? _weather;

  // Fetching weather data
  _fetchWeather() async {
    String currentCity = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(currentCity);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Page'),
      ),
      body: const Center(
        child: Text('Weather Page'),
      ),
    );
  }
}
