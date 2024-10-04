
import 'package:flutter/material.dart';

import 'otp.dart';

class PhoneEmailPage extends StatefulWidget {
  @override
  _PhoneEmailPageState createState() => _PhoneEmailPageState();
}

class _PhoneEmailPageState extends State<PhoneEmailPage> {
  bool isPhone = true; // To toggle between phone and email input

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/image.jpeg', // Replace with your logo path
              height: 100,
            ),
            SizedBox(height: 30),

            // Toggle Buttons for Phone and Email
            ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Phone'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Email'),
                ),
              ],
              isSelected: [isPhone, !isPhone],
              onPressed: (index) {
                setState(() {
                  isPhone = index == 0;
                });
              },
              borderRadius: BorderRadius.circular(10),
              fillColor: Colors.redAccent,
              selectedColor: Colors.white,
              color: Colors.black,
            ),

            SizedBox(height: 40),

            // Header Text
            Text(
              'Glad to see you!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Sub Header
            Text(
              isPhone
                  ? 'Please provide your phone number'
                  : 'Please provide your email address',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Phone or Email Input Field
            TextField(
              controller: _phoneController,
              keyboardType: isPhone ? TextInputType.phone : TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: isPhone ? 'Phone' : 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 30),

            // Send OTP Button
            ElevatedButton(
              onPressed: () {
                if (_phoneController.text.isNotEmpty) {
                  // Navigate to OTP page and pass the phone number to it
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpVerificationPage(
                        phoneNumber: _phoneController.text, // Pass the phone number
                      ),
                    ),
                  );
                } else {
                  // Show error if phone number is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter your phone number'),
                    ),
                  );
                }
              },
              child: Text('SEND CODE'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20), backgroundColor: Colors.pinkAccent, // Button color
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}