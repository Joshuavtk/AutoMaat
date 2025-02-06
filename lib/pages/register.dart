import 'package:auto_maat/pages/home.dart';
import 'package:auto_maat/pages/register_finish.dart';
import 'package:flutter/material.dart';

import '../ui/login_wrapper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterScreen> {
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController = TextEditingController();
  final TextEditingController _passwordRepeatFieldController = TextEditingController();
  String statusMessage = '';

  @override
  Widget build(BuildContext context) {
    return loginWrapper(context, children: <Widget>[
      const Image(
        image: AssetImage('images/splash_screen.png'),
        height: 50,
      ),
      const SizedBox(height: 20.0),
      const Text(
        "Create AutoMaat-account",
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.end,
      ),
      const Text("Register your account"),
      const SizedBox(height: 20.0),
      TextField(
        controller: _emailFieldController,
        decoration: const InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _passwordFieldController,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _passwordRepeatFieldController,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Repeat password',
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 10.0),
      Text(statusMessage, style: const TextStyle(color: Colors.red),),
      Row(
        children: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Back to login')),
          const Spacer(),
          ElevatedButton(
              onPressed: () => goNextRegisterStep(),
              child: const Text('Create account')),
        ],
      ),
    ]);
  }

  goNextRegisterStep() {
    setState(() {
      statusMessage = "";
    });

    if (_emailFieldController.text == '' || _passwordFieldController.text == '') {
      setState(() {
        statusMessage = 'Error registering, fields may not be empty';
      });
      return null;
    }

    if (_passwordFieldController.text != _passwordRepeatFieldController.text) {
      statusMessage = 'Error registering, passwords do not match.';
      print('passwords dont match');
      return null;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterFinishScreen(
      email: _emailFieldController.text,
      password: _passwordFieldController.text,
    )));
  }
}
