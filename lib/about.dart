import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "ABOUT DRY SENSE",
            style: TextStyle(letterSpacing: 2, fontSize: 20, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'IoT Based Cloth Drying Monitoring System with NodeMCU and Moisture Sensor',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                const Text(
                  'The Dry Sense project is an Internet of Things (IoT) based solution designed to monitor and '
                      'determine whether cloth is dry or not. This system utilizes IoT devices, sensors, and cloud '
                      'connectivity to provide real-time data, helping users manage the drying process effectively.',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Project Overview',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const Text(
                  'This project addresses the common challenge of ensuring that cloth is adequately dried, preventing '
                      'dampness and associated issues such as mold growth and odor. The system employs a NodeMCU '
                      'microcontroller as the central processing unit, interfacing with various components to monitor '
                      'moisture levels in the cloth.',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    Image.asset('assets/NodeMCU.jpg'), // Updated image
                    const Text(
                      'NodeMCU Microcontroller',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const Text(
                      'The NodeMCU is a versatile, Wi-Fi-enabled microcontroller that serves as the core processing '
                          'unit of the Dry Sense system. It connects to the moisture sensor to receive real-time '
                          'data on moisture levels and displays this information. The NodeMCU also manages the '
                          'system\'s connectivity with the cloud or a mobile app for remote monitoring and notifications.',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 40),
                    Image.asset('assets/Moisture_Sensor.jpg'),
                    const Text(
                      'Moisture Sensor',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const Text(
                      'This sensor is the primary tool for detecting the moisture level in cloth. Positioned '
                          'strategically, it measures the amount of water content in the cloth by evaluating '
                          'conductivity. When the moisture level falls below a certain threshold, the sensor '
                          'signals that the cloth is dry.',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 40),
                    Image.asset('assets/Display.jpg'),
                    const Text(
                      'Display (LCD)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const Text(
                      'The display, connected to the NodeMCU, shows the current moisture levels in real-time, '
                          'giving users immediate feedback on the cloth\'s dryness status. This component can be '
                          'an OLED or LCD screen, depending on requirements, and displays moisture levels in a '
                          'user-friendly format.',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Connecting Wires',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const Text(
                      'Wires are used to establish connections between the NodeMCU, moisture sensor, and display. '
                          'These connections facilitate data flow between components, allowing the NodeMCU to collect '
                          'moisture data and communicate results to the display and cloud interface.',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Power Supply',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const Text(
                      'To power the components, a suitable power source is required. For portability, '
                          'a battery pack can be used, or the system can be connected to an adapter for continuous '
                          'power. Proper power management is essential for stable and reliable system performance.',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Functionality',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const Text(
                  'The Dry Sense system can operate in both manual and automatic modes. In automatic mode, '
                      'the system provides alerts or notifications when the cloth reaches a predefined dryness '
                      'level, helping users optimize their drying processes. In manual mode, users can check '
                      'moisture levels directly via the display.',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                const Text(
                  'User Interaction',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const Text(
                  'Users can monitor moisture levels and receive notifications through a mobile application, '
                      'such as the Blynk app, ensuring they have easy access to important information regarding '
                      'their drying processes. This setup promotes efficiency in managing cloth drying, minimizing '
                      'energy usage, and preventing waste.',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Conclusion',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const Text(
                  'The Dry Sense project exemplifies an innovative approach to managing drying processes using IoT '
                      'technology. By integrating a moisture sensor with the NodeMCU and providing real-time '
                      'monitoring through a display and mobile app, this system enhances user experience and promotes '
                      'effective cloth management.',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 40),
                const Text(
                  'Version: 1.0.0',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
