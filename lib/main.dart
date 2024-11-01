import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'weather.dart'; // Import the WeatherScreen
import 'about.dart';   // Import the AboutScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dry Sense',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProvisioningScreen(title: 'Dry Sense'),
    );
  }
}

class ProvisioningScreen extends StatefulWidget {
  const ProvisioningScreen({super.key, required this.title});
  final String title;

  @override
  State<ProvisioningScreen> createState() => _ProvisioningScreenState();
}

class _ProvisioningScreenState extends State<ProvisioningScreen> {
  String moistureStatus = "Waiting...";
  bool isFetching = false;
  Timer? timer;

  // Replace with your ESP8266’s IP address
  final String esp8266IpAddress = "192.168.54.169"; // Replace with actual IP

  Future<void> fetchMoistureStatus() async {
    setState(() {
      isFetching = true;
    });

    try {
      final response = await http.get(Uri.parse("http://$esp8266IpAddress/data"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          moistureStatus = data["moisture_status"] ?? "Waiting...";
        });
      } else {
        setState(() {
          moistureStatus = "Error fetching data (status code: ${response.statusCode})";
        });
      }
    } catch (e) {
      setState(() {
        moistureStatus = "Waiting for connection...";
      });
    } finally {
      setState(() {
        isFetching = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMoistureStatus();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => fetchMoistureStatus());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Moisture Status:',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            Text(
              moistureStatus,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                color: moistureStatus == "Wet" ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeatherScreen()),
                );
              },
              child: const Text("Check Weather Today"),
            ),
          ],
        ),
      ),
    );
  }
}
