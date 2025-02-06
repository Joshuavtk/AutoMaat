import 'package:auto_maat/pages/home.dart';
import 'package:auto_maat/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:auto_maat/pages/reserve.dart';
import 'package:auto_maat/pages/zoek.dart';
import 'package:auto_maat/pages/rentals.dart';
import 'package:auto_maat/pages/internet_check.dart';

import 'database/database.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginScreen());
  }
}

Future main() async {
  await dotenv.load(fileName: ".env");

  // Check in local storage if session token exists
  AppDatabase database = AppDatabase();
  var users = await database.getUsers();
  database.close();

  print(users.isNotEmpty);
  if (users.isNotEmpty) {
    UserData userData = users.first;
    String token = userData.token;


    runApp(const HomeApp());
  } else {
    runApp(const LoginApp());
  }
}
