#include <Wire.h>
#include <LiquidCrystal_PCF8574.h>
#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

// Define the I2C address for your LCD (usually 0x27 or 0x3F)
#define I2C_ADDRESS 0x27 // Replace with your LCD's I2C address if necessary

// Create an instance of the LiquidCrystal_PCF8574
LiquidCrystal_PCF8574 lcd(I2C_ADDRESS);

// Moisture sensor digital pin
const int moisturePin = D6;
bool isWet = false;
bool previousMoistureState = false;

// Wi-Fi credentials
const char* ssid = "Wifi";        // Your Wi-Fi SSID
const char* password = "XPX00AKM"; // Your Wi-Fi Password

// Create a web server on port 80
ESP8266WebServer server(80);

void setup() {
    Serial.begin(115200);
    
    // Initialize the LCD
    lcd.begin(16, 2);       // 16 columns, 2 rows
    lcd.setBacklight(255);  // Turn on backlight at full brightness

    // Set up the moisture sensor pin as input
    pinMode(moisturePin, INPUT);
    lcd.clear();
    lcd.print("-- Dry Sense --");
    delay(2000);
    lcd.clear();
    lcd.print("Wifi connecting...:");

    // Connect to Wi-Fi
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    Serial.println("\nConnected to Wi-Fi!");
    lcd.clear();
    lcd.print("Wifi connected");
    delay(2000);
    lcd.clear();
    Serial.print("IP address: ");
    Serial.println(WiFi.localIP());

    // Define the URL handler for data retrieval
    server.on("/data", HTTP_GET, handleDataRequest);

    // Start the server
    server.begin();
    Serial.println("Server started");

    // Initial display on the LCD
    lcd.setCursor(0, 0);
    lcd.print("Moisture:");
}

void loop() {
    // Read the moisture sensor value (HIGH or LOW)
    isWet = digitalRead(moisturePin) == LOW; // Assuming LOW means wet and HIGH means dry

    // Update the LCD only if the moisture state has changed
    if (isWet != previousMoistureState) {
        previousMoistureState = isWet;
        lcd.setCursor(0, 1);
        lcd.print(isWet ? "Wet " : "Dry ");
        
        // Print to Serial Monitor for debugging
        Serial.print("Moisture sensor value: ");
        Serial.println(digitalRead(moisturePin));
        Serial.print("Moisture status: ");
        Serial.println(isWet ? "Wet" : "Dry");
    }

    // Handle client requests
    server.handleClient();

    delay(1000); // Delay for readability
}

// Handle HTTP GET requests for /data
void handleDataRequest() {
    String jsonResponse = "{";
    jsonResponse += "\"moisture_status\":\"";
    jsonResponse += isWet ? "Wet" : "Dry";
    jsonResponse += "\"}";

    server.send(200, "application/json", jsonResponse);
}
