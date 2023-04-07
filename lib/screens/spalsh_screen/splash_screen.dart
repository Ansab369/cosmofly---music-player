// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '/route.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final isFirstTime;

  Future<void> loadStateFromStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool('isOnboarded')!;
  }

  @override
  void initState() {
    loadStateFromStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
          context, isFirstTime ? route.homeScreen : route.onBoardingPage);
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(-0.16088707745075226, 0.9168827533721924),
              end: Alignment(-0.9168827533721924, -0.7534888386726379),
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromRGBO(15, 8, 23, 1),
                Color.fromRGBO(15, 8, 23, 1),
              ]),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset('assets/Cosmofly.png'),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 290,
                child: SpinKitCircle(
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
