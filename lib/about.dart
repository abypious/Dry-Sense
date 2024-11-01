// about.dart
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Dry Sense"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dry Sense',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              const Text(
                'Dry Sense is an app designed to monitor soil moisture levels and provide real-time weather information to help users manage soil health effectively. '
                    'The app integrates with an ESP8266 device to fetch moisture data and provides weather updates for better crop and soil management.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Version: 1.0.0',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
