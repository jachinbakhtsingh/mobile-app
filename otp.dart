import 'package:flutter/material.dart';

import 'new.dart';

class OtpVerificationPage extends StatefulWidget {
  final String phoneNumber;

  OtpVerificationPage({required this.phoneNumber});

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Listen for changes in each OTP field
    otpController1.addListener(_onOtpChanged);
    otpController2.addListener(_onOtpChanged);
    otpController3.addListener(_onOtpChanged);
    otpController4.addListener(_onOtpChanged);
  }

  void _onOtpChanged() {
    // Check if all 4 OTP fields are filled
    if (otpController1.text.isNotEmpty &&
        otpController2.text.isNotEmpty &&
        otpController3.text.isNotEmpty &&
        otpController4.text.isNotEmpty) {
      // If all 4 OTP fields are filled, navigate to the registration page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NewUserRegistrationPage()),
      );
    }
  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon.png', // Replace with your asset path
              height: 100,
            ),
            SizedBox(height: 30),
            Text(
              'OTP Verification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('We have sent a unique OTP to your phone number'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                otpInputField(otpController1),
                otpInputField(otpController2),
                otpInputField(otpController3),
                otpInputField(otpController4),
              ],
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // Logic to resend OTP
                print('Resend OTP');
              },

              child: Text('SEND AGAIN'),
            ),
          ],
        ),
      ),
    );
  }

  // OTP input field UI
  Widget otpInputField(TextEditingController controller) {
    return Container(
      width: 50,
      child: TextField(
        controller: controller,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
