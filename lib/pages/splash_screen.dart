import 'package:auto_maat/pages/login.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatelessWidget {
    const SplashScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
          const Image(image: AssetImage('images/splash_screen.png')),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen())),
              child: const Text('Doorgaan')),
        ])));
    }
}
