import 'package:auto_maat/pages/home.dart';
import 'package:auto_maat/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'database/database.dart';
import 'firebase_options.dart';

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

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // You may set the permission requests to "provisional" which allows the user to choose what type
  // of notifications they would like to receive once the user receives a notification.
  final notificationSettings = await FirebaseMessaging.instance.requestPermission(provisional: true);

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('Android pushnotifications token: $fcmToken');


  print(users.isNotEmpty);
  if (users.isNotEmpty) {
    UserData userData = users.first;
    String token = userData.token;

    runApp(const HomeApp());
  } else {
    runApp(const LoginApp());
  }
}
