import 'dart:ffi';

import 'package:auto_maat/modules/user/user_service.dart';
import 'package:auto_maat/pages/forgot_password.dart';
import 'package:auto_maat/pages/register.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:auto_maat/ui/button.dart';

import 'dart:async';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController = TextEditingController();
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Image(image: AssetImage('images/splash_screen.png'), height: 50,),
                      const Text("Log in"),
                      const Text("Log in with your AutoMaat account"),
                      TextField(
                        controller: _emailFieldController,
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                      TextField(
                        controller: _passwordFieldController,
                        decoration: const InputDecoration(hintText: 'Password'),
                      ),
                      Checkbox(value: checkboxValue, onChanged: (e) => checkboxValue = true, ),
                      const Text("Show password"),
                      TextButton(onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const ForgotPasswordScreen())),
                          child: const Text('Forgot password?')),
                      TextButton(
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const RegisterScreen())),
                          child: const Text('Create account')),
                      ElevatedButton(
                          onPressed: () => print(authenticate('test', 'test', true)),
                          child: const Text('Login')),

          // exampleButton([checkboxValue, _passwordFieldController.text]),
        ]))));
  }
}
