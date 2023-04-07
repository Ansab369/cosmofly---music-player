// ignore_for_file: prefer_const_constructors

import 'package:cosmofly/screens/music_screen.dart/music_screen.dart';
import 'package:flutter/material.dart';

//! import screens
import 'package:cosmofly/screens/home_screen/home_screen.dart';
import 'package:cosmofly/screens/not_found_screen/not_found_screen.dart';
import 'package:cosmofly/screens/spalsh_screen/splash_screen.dart';
import 'package:cosmofly/screens/onboarding_screen/onboarding_screen.dart';

//! route name
const String splashPage = '/splashScreen';
const String onBoardingPage = '/onboardingScreen';
const String homeScreen = '/homeScreen';
const String musicScreen = '/musicScreen';

Route<dynamic> generateMainRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashPage:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case onBoardingPage:
      return MaterialPageRoute(builder: (context) => OnboardingScreen());
    case musicScreen:
      return MaterialPageRoute(builder: (context) => MusicScreen());
    default:
      return MaterialPageRoute(builder: (context) => NotFoundScreen());
  }
}
