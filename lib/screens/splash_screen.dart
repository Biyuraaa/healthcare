import 'package:flutter/material.dart';
import 'package:healthcare/screens/welcome_screen.dart';
import 'package:healthcare/services/authentication/auth_page.dart'; // Import the WelcomeScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to WelcomeScreen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            'images/LOGO.png'), // Adjust the path to your logo image
      ),
    );
  }
}
