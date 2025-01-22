import 'package:auto_maat/pages/home.dart';
import 'package:flutter/material.dart';

import '../ui/login_wrapper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterScreen> {
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController = TextEditingController();
  final TextEditingController _passwordRepeatFieldController = TextEditingController();

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
        controller: _nameFieldController,
        decoration: const InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
      ),
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
        decoration: const InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _passwordRepeatFieldController,
        decoration: const InputDecoration(
          labelText: 'Repeat password',
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 10.0),
      Row(
        children: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Back to login')),
          const Spacer(),
          ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Home())),
              child: const Text('Create account')),
        ],
      ),
    ]);
  }
}
