import 'package:flutter/material.dart';
import 'pages/splash screen.dart';

//test imports
import 'pages/zoek.dart';
import 'pages/map.dart';
import 'pages/contact.dart';
import 'pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: SplashScreen());
  }
}

void main() => runApp(const App());
