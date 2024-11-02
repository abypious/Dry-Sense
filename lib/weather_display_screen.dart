import 'package:flutter/material.dart';
import 'weather.dart';

class WeatherDisplayScreen extends StatefulWidget {
  const WeatherDisplayScreen({Key? key}) : super(key: key);

  @override
  _WeatherDisplayScreenState createState() => _WeatherDisplayScreenState();
}

class _WeatherDisplayScreenState extends State<WeatherDisplayScreen> {
  List<String> rainForecast = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRainData();
  }




  Future<void> fetchRainData() async {
    try {
      final forecast = await WeatherScreen.fetchRainPrediction();
      setState(() {
        rainForecast = forecast;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        rainForecast = ['Error: $e'];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "WEATHER TODAY",
            style: TextStyle(letterSpacing: 2, fontSize: 20, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : rainForecast.isNotEmpty
          ? ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: rainForecast.length,
        itemBuilder: (context, index) {
          return _buildForecastCard(rainForecast[index]);
        },
      )
          : const Center(
        child: Text(
          'No rain expected in the next few hours.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }

  // Method to build each forecast card with UI improvements
  Widget _buildForecastCard(String forecast) {
    // Sample condition to determine rain intensity (this can be customized further)
    final probability = int.parse(forecast.split(':').last.trim().replaceAll('%', ''));
    final rainIcon = probability > 50
        ? Icons.cloud
        : probability > 20
        ? Icons.cloud_queue
        : Icons.cloud_off;
    final rainColor = probability > 50
        ? Colors.blue
        : probability > 20
        ? Colors.orange
        : Colors.grey;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(rainIcon, color: rainColor, size: 40),
        title: Text(
          forecast.split(':')[0], // Displays the time
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          forecast, // Displays full rain prediction message
          style: const TextStyle(fontSize: 16),
        ),
        trailing: Text(
          forecast.split(':').last, // Shows rain probability percentage
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: rainColor,
          ),
        ),
      ),
    );
  }
}
