import 'package:adv_ass7_1/screens/HomePage.dart';
import 'package:adv_ass7_1/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: 'splash',
      debugShowCheckedModeBanner: false,
      routes: {
        'splash': (context) => const SplashScreen(),
        'home_page': (context) => const HomePage(),
      },
    ),
  );
}
