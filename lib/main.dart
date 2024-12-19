import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

//test imports
import 'pages/zoek.dart';
import 'pages/map.dart';
import 'pages/contact.dart';
import 'pages/home.dart';
import 'pages/database_test.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: DatabaseTest());
  }
}

void main() => runApp(const App());
