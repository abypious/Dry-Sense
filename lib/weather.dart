import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class WeatherScreen {
  static const String apiKey = 'c3dcc587e7a6e00d06a71bf1fbc86f4a';

  static Future<List<String>> fetchRainPrediction() async {
    Position position = await _determinePosition();
    final latitude = position.latitude;
    final longitude = position.longitude;

    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return _parseRainData(data);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  // Function to parse rain data for today only, at 30-minute intervals
  static List<String> _parseRainData(Map<String, dynamic> data) {
    final list = data['list'];
    List<String> rainForecast = [];

    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    for (var entry in list) {
      final dateTime = DateTime.parse(entry['dt_txt']);

      // Check if the forecast is for today and at a 30-minute interval
      if (dateTime.year == today.year &&
          dateTime.month == today.month &&
          dateTime.day == today.day &&
          dateTime.minute % 30 == 0) {

        final probability = entry['pop']; // Probability of precipitation
        if (probability != null) {
          rainForecast.add(
              'Rain probability at ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}: ${((probability ?? 0) * 100).toInt()}%');
        }
      }
    }

    return rainForecast.isNotEmpty ? rainForecast : ['No rain expected in the next few hours.'];
  }

  // Function to get the current position of the device
  static Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }
}
