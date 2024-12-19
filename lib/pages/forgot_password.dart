import 'dart:ffi';

import 'package:auto_maat/pages/login.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:auto_maat/ui/button.dart';

import 'dart:async';
import 'dart:convert';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Image(
                        image: AssetImage('images/splash_screen.png'),
                        height: 50,
                      ),
                      const Text("Forgot password"),
                      const Text("Type in your e-mail so we can send you the recovery code."),
                      TextField(
                        controller: _emailFieldController,
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                      TextButton(onPressed: () => Navigator.pop(context),
                          child: const Text('Back to login')),
                      TextButton(
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const LoginScreen())),
                          child: const Text('Send code')),
                    ]))));
  }
}
