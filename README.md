<img width="1280" alt="readme-banner" src="https://github.com/user-attachments/assets/35332e92-44cb-425b-9dff-27bcf1023c6c">

Dry Sense

## Basic Details
### Team Name: Seed


### Team Members
- Team Lead: Athira Vijayan - Rajiv Gandhi Institute of Technology, Kottayam
- Member 2: Aby Pious Vinoy - Rajiv Gandhi Institute of Technology, Kottayam
- Member 3: Sreeraj K - Rajiv Gandhi Institute of Technology, Kottayam

### Project Description
Dry Sense is an IoT-based cloth drying monitor that uses a NodeMCU and moisture sensor to track drying progress. It provides real-time updates via display and mobile app, along with daily weather forecasts to help users plan drying times efficiently, ensuring optimal drying and preventing dampness.

### The Problem (that doesn't exist)
In a world where self-drying clothing unpredictably absorbs and releases moisture depending on environmental conditions, people face a frustrating challenge: planning when to wear clothes with optimal dryness. This situation is worsened by unexpected weather changes, causing clothes to reabsorb humidity, leaving users constantly uncertain about their wardrobe choices.

### The Solution (that nobody asked for)
An IoT-based moisture stabilization app equipped with real-time moisture monitoring and integrated weather forecasting. Using sensors, the app tracks moisture levels in self-drying garments, while the weather forecasting feature predicts humidity, temperature, and rainfall for the entire day. This allows users to monitor their clothing’s dryness status and make informed decisions based on full-day weather predictions, ensuring optimal comfort and convenience.

## Technical Details
### Technologies/Components Used
For Software:
- Dart
- Flutter
- ESP Smartconfig, Geolocator, Meterial ui
- Android studio, Figma, ChatGpt, OpenWeather API, Git

For Hardware:
- NodeMCU 8266, Moisture sensor, LCD Display
- NodeMCU: Wi-Fi enabled microcontroller, 80/160 MHz, 4MB Flash memory, operating voltage of 3.3V, Moisture sensor: Operating voltage of 3.3-5V, analog output for moisture detection, LCD Display: 16x2 or 20x4 LCD, compatible with 3.3V and 5V systems.
- Breadboard and Jumper Wires for circuit connections, Soldering Iron (optional, for permanent connections), Power Supply (battery or adapter compatible with NodeMCU), Micro-USB Cable (for programming NodeMCU and power)

### Implementation
For Software:
# Installation
# For Git
git clone https://github.com/yourusername/DrySense.git
cd DrySense
# For Arduino IDE
Install ESP8266WiFi library
Install Adafruit_Sensor library
Install LiquidCrystal_I2C library
# For Flutter
flutter pub get


# Run
Upload code to NodeMCU using Arduino IDE:

Connect NodeMCU to the computer via USB.
Select NodeMCU 1.0 in Tools > Board.
Upload the code to start monitoring moisture.
# For Flutter
flutter run

Open the app and connect to the Dry Sense system to view moisture levels and daily weather forecasts.

### Project Documentation
For Software:
Here’s the README file for your Git repository:

# Dry Sense - IoT-Based Cloth Drying Monitoring System

![readme-banner](https://github.com/user-attachments/assets/35332e92-44cb-425b-9dff-27bcf1023c6c)

**Dry Sense** is an IoT-based project aimed at monitoring the drying status of cloth using NodeMCU and a moisture sensor. This system leverages IoT technology to provide real-time data, helping users effectively manage their cloth drying processes.

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [System Components](#system-components)
- [Functionality](#functionality)
- [User Interaction](#user-interaction)
- [Screenshots](#screenshots)
- [Version](#version)

## Project Overview

The **Dry Sense** project addresses the challenge of ensuring that cloth is adequately dried, preventing dampness and related issues like mold growth and odor. It uses a **NodeMCU microcontroller** as the main processing unit, interfacing with a **moisture sensor** to monitor moisture levels in the cloth.

## Features

- Real-time monitoring of moisture levels in cloth
- Manual mode for checking moisture levels on-demand
- Weather Forecasting

## Functionality

The **Dry Sense** system operates in both manual and automatic modes:
- **Automatic Mode:** Provides notifications when the cloth reaches a predefined dryness level.
- **Manual Mode:** Allows users to check moisture levels directly on the display.

## User Interaction

Users can monitor moisture levels and receive notifications through a mobile application, such as the Blynk app, which provides easy access to essential drying information. This setup optimizes cloth drying and minimizes energy usage.

## Screenshots

<div align="center">
    <img src="https://github.com/user-attachments/assets/0573bc13-3e5d-40cc-8935-08bbcc6a5a6a" width="45%" alt="Cloth is Wet Notification" />
    <img src="https://github.com/user-attachments/assets/7812bd83-72c4-4582-9fab-4e1208f9c45f" width="45%" alt="Cloth is Dry Notification" />
</div>

<p align="center">Notification examples for wet (left) and dry (right) cloth status.</p>

<div align="center">
    <img src="https://github.com/user-attachments/assets/16cdf0cd-1cb8-49dd-a9ee-e8760c591345" width="45%" alt="Module Connection Waiting" />
    <img src="https://github.com/user-attachments/assets/a2884765-8d87-4349-8817-44d20d406e49" width="45%" alt="Weather Forecasting Dashboard" />
</div>

<p align="center">Connection waiting status (left) and the weather forecasting dashboard for real-time data display (right).</p>

<div align="center">
    <img src="https://github.com/user-attachments/assets/65ab2fc2-3aa0-476c-8549-80f399679c81" width="45%" alt="About Page" />
</div>

<p align="center">The About Page displaying the mission and values of the organization.</p>

## Schematic & Circuit

<div align="center">
    <img src="https://github.com/user-attachments/assets/102c1f7f-93bb-4941-9671-fe9e9866dc69" width="60%" alt="Circuit Schematic" />
</div>

<p align="center">Circuit schematic for the Dry Sense system, detailing component connections.</p>

## Components

<div align="center">
    <img src="https://github.com/user-attachments/assets/12924c75-9314-4f7b-9c8e-63b646be799e" width="30%" alt="NodeMCU 8266 Microcontroller" />
    <img src="https://github.com/user-attachments/assets/c934e34f-bdc7-4c05-8d40-158bcbf48f7a" width="30%" alt="16x2 I2C LCD Display" />
    <img src="https://github.com/user-attachments/assets/8d5c3349-3b6a-4b34-888a-cfc0c5473a55" width="30%" alt="Moisture Sensor" />
</div>

<p align="center">Photos of key hardware components: NodeMCU microcontroller, LCD display, and moisture sensor.</p>

## Development Images

<div align="center">
    <img src="https://github.com/user-attachments/assets/0857ee88-8e4e-4321-a57c-9857c8d2282a" width="45%" alt="Development Image 1" />
    <img src="https://github.com/user-attachments/assets/be5740e7-e8fd-4ee9-bcb1-35c83a8c067e" width="45%" alt="Development Image 2" />
</div>

<p align="center">Images of the development phase for the Dry Sense project.</p>

## Final Project Images

<div align="center">
    <img src="https://github.com/user-attachments/assets/425626a4-307e-450c-b402-c6d3d9b2a633" width="50%" alt="Final Project Setup" />
</div>

<p align="center">Completed project setup showing the final version of the Dry Sense system.</p>

## Project Demo
[Videos](https://drive.google.com/drive/folders/1LhUUJdU6L1q_gl54QoHN0NawcJaNl_-E?usp=sharing)

## Team Contributions
- **ABY PIOUS VINOY**: Hardware Development
- **ATHIRA VIJAYAN**: Application Building
- **SREERAJ K**: Application Building

---

Made with ❤️ at TinkerHub Useless Projects

![Static Badge](https://img.shields.io/badge/TinkerHub-24?color=%23000000&link=https%3A%2F%2Fwww.tinkerhub.org%2F)
![Static Badge](https://img.shields.io/badge/UselessProject--24-24?link=https%3A%2F%2Fwww.tinkerhub.org%2Fevents%2FQ2Q1TQKX6Q%2FUseless%2520Projects)
