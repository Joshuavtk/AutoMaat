import 'dart:ffi';

import 'package:auto_maat/pages/home.dart';
import 'package:auto_maat/pages/login.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:auto_maat/ui/button.dart';

import 'dart:async';
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterScreen> {
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();
  final TextEditingController _passwordRepeatFieldController =
      TextEditingController();

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
          const Text("Create AutoMaat-account"),
          const Text("Register your account"),
          TextField(
            controller: _nameFieldController,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          TextField(
            controller: _emailFieldController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: _passwordFieldController,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          TextField(
            controller: _passwordRepeatFieldController,
            decoration: const InputDecoration(hintText: 'Repeat password'),
          ),
          Checkbox(
            value: false,
            onChanged: (e) => print(e),
          ),
          const Text("Show password"),
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to login')),
          TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home())),
              child: const Text('Create account')),
        ]))));
  }
}
