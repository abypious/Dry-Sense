// weather.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String weatherInfo = "Fetching weather...";

  // Replace with your API key and city
  final String weatherApiKey = "your_api_key_here"; // Replace with actual API key
  final String city = "YourCity"; // Replace with your city name

  Future<void> fetchWeather() async {
    try {
      final response = await http.get(
        Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$weatherApiKey&units=metric"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final temperature = data["main"]["temp"];
        final description = data["weather"][0]["description"];

        setState(() {
          weatherInfo = "Temperature: $temperature°C\nCondition: $description";
        });
      } else {
        setState(() {
          weatherInfo = "Error fetching weather (status code: ${response.statusCode})";
        });
      }
    } catch (e) {
      setState(() {
        weatherInfo = "Error connecting to weather service.";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Today"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            weatherInfo,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
