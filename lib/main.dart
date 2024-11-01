import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      home: const MyHomePage(title: 'Dry Sense'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isConnected = false; // Track if connected to NodeMCU
  String _moistureStatus = "Unknown"; // Moisture status, default is "Unknown"
  final String _nodemcuIp = '192.168.4.1'; // Replace with NodeMCU IP address

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  // Check connection with the NodeMCU by attempting to fetch data
  Future<void> _checkConnection() async {
    try {
      final response = await http.get(Uri.parse('http://$_nodemcuIp/data'));
      if (response.statusCode == 200) {
        setState(() {
          _isConnected = true;
          _moistureStatus = json.decode(response.body)['moisture_status'];
        });
      }
    } catch (e) {
      setState(() {
        _isConnected = false;
        _moistureStatus = "Unknown";
      });
    }
  }

  // Fetch the latest moisture status from the NodeMCU
  Future<void> _fetchMoistureStatus() async {
    if (!_isConnected) {
      _checkConnection();
      return;
    }
    try {
      final response = await http.get(Uri.parse('http://$_nodemcuIp/data'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _moistureStatus = data['moisture_status'];
        });
      }
    } catch (e) {
      setState(() {
        _moistureStatus = "Error fetching status";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Connection status indicator
            Text(
              _isConnected ? "Connected to NodeMCU" : "Not connected",
              style: TextStyle(
                color: _isConnected ? Colors.green : Colors.red,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Button to refresh connection status
            ElevatedButton(
              onPressed: _checkConnection,
              child: const Text("Connect to NodeMCU"),
            ),
            const SizedBox(height: 20),

            // Moisture status display
            Text(
              'Moisture Status: $_moistureStatus',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Button to refresh moisture status
            ElevatedButton(
              onPressed: _fetchMoistureStatus,
              child: const Text("Check Moisture Status"),
            ),
          ],
        ),
      ),
    );
  }
}
