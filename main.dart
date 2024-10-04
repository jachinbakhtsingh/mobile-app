import 'package:flutter/material.dart';
import 'splash_screen.dart';  // Import the splash screen

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set the splash screen as the first page
    );
  }
}
