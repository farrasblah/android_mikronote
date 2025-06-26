import 'dart:async';
import 'package:flutter/material.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 900), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HalamanUtama()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "μikro",
                style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "Note",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
