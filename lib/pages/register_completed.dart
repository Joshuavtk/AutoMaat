import 'package:auto_maat/pages/login.dart';
import 'package:flutter/material.dart';

import '../ui/login_wrapper.dart';

class RegisterCompleted extends StatelessWidget {
  const RegisterCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return loginWrapper(context, children: <Widget>[
      const Image(
        image: AssetImage('images/splash_screen.png'),
        height: 50,
      ),
      const SizedBox(height: 20.0),
      const Text(
        'Account created successfully!',
        style: TextStyle(
          fontSize: 23,
        ),
      ),
      const Text('Please check your email to finish registering your account.'),
      const SizedBox(height: 10.0),
      ElevatedButton(
          onPressed: () => Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false),
          child: const Text('Go to login')),
    ]);
  }
}
