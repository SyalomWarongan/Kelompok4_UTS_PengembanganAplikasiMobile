import 'dart:async';

import 'package:dailydosenews_uts/Home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 13);
    return Timer(duration, route);
  }

  void route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              Home()), // Replace HomeScreen() with your actual Home widget
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: Container(
        child: Lottie.network(
            'https://lottie.host/4b9fe4c9-faa0-40a8-8ec1-cd8959006a40/mYbttBjs7O.json'),
      ),
    );
  }
}
