import 'package:flutter/material.dart';
import './splash screen.dart';

//test imports
import './zoek.dart';
import './map.dart';
import './contact.dart';
import './home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: SplashScreen());
  }
}

void main() => runApp(const App());
