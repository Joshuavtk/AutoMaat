import 'package:auto_maat/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:auto_maat/pages/reserve.dart';
import 'package:auto_maat/pages/zoek.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Zoek());
  }
}

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const App());
}
