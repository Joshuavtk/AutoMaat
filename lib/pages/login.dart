import 'dart:ffi';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _exampleButton(),
                    ]))));
  }
}
