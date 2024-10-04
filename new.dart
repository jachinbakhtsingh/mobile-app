import 'package:flutter/material.dart';
import 'package:machinetest/page.dart';

class NewUserRegistrationPage extends StatelessWidget {
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
              'assets/image.jpeg', // Replace with your logo path
              height: 100,
            ),
            Text(
              'Let\'s Begin!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Please enter your credentials to proceed'),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Create Password',
                suffixIcon: Icon(Icons.visibility),
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Referral Code (Optional)',
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.red, size: 40),
                onPressed: () {
                  // When arrow button is clicked, navigate to KYC page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KycPendingPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
