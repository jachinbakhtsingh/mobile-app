import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Device ID for the API call
  final String deviceId = "62b341aeb0ab5ebe28a758a3";

  @override
  void initState() {
    super.initState();
    _callSplashScreenApi();
  }

  // Method to call the API
  Future<void> _callSplashScreenApi() async {
    const String apiUrl = "http://devapiv4.dealsdray.com/api/v2/user/device/add";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "deviceId": deviceId,
        }),
      );

      if (response.statusCode == 200) {
        // Successful response
        print("API Response: ${response.body}");
        _navigateToNextScreen();
      } else {
        // Handle error
        print("Failed to call API: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // Navigate to the next screen after the splash screen
  void _navigateToNextScreen() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display an image on the splash screen
            Image.asset(
              'assets/image.jpeg', // Replace with your image path
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(), // Simple loading indicator
          ],
        ),
      ),
    );
  }
}
