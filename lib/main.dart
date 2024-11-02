import 'package:dry_sense/weather_display_screen.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'dart:async';
import 'weather.dart';
import 'about.dart';

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

  final String esp8266IpAddress = "192.168.54.169";

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
          moistureStatus = "Error fetching data...";
        });
      }
    } catch (e) {
      setState(() {
        moistureStatus = "Waiting...";
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
    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => fetchMoistureStatus());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;
    String statusMessage;
    String subMessage;
    String gifUrl;

    if (moistureStatus == "Dry") {
      statusColor = Colors.yellow[700]!;
      statusIcon = Icons.check_circle_outline;
      statusMessage = "Dry !!!";
      subMessage = "Your clothes are all set—sun-kissed, fresh, and ready to go! Time to grab them and wear that warmth! 🌞";
      gifUrl = 'assets/dry.gif';
    } else if (moistureStatus == "Wet") {
      statusColor = Colors.redAccent;
      statusIcon = Icons.error_outline;
      statusMessage = "Wet !!!";
      subMessage = "Almost there! The clothes are still soaking up some sun. Give them a little more time, and they’ll be fresh and dry soon! ☺️";
      gifUrl = 'assets/wet.gif';
    } else {
      statusColor = Colors.grey;
      statusIcon = Icons.hourglass_empty;
      statusMessage = "Waiting...";
      subMessage = "Hold on just a moment! We’re wrapping up the last bits of data collection. It’ll be ready before you know it! 😊";
      gifUrl = 'assets/wait.gif';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "DRY SENSE",
            style: TextStyle(letterSpacing: 2, fontSize: 20, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 30),
          if (moistureStatus != "Waiting...")
            Text(
              'Your cloth is now',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          if (moistureStatus != "Waiting...") const SizedBox(height: 8),
          Text(
            statusMessage,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Icon(
            statusIcon,
            size: 60,
            color: statusColor,
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.yellow[100],
              border: Border.all(color: Colors.yellow[700]!, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              subMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 30),
            Image.asset(
              gifUrl,
              height: 180,
              width: 180,
              fit: BoxFit.cover,
            ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeatherDisplayScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("KNOW THE WEATHER TODAY"),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
