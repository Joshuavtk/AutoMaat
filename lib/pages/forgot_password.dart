import 'package:auto_maat/pages/login.dart';
import 'package:flutter/material.dart';

import '../modules/user/user_service.dart';
import '../ui/login_wrapper.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailFieldController = TextEditingController();
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
        "Forgot password",
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.end,
      ),
      const Text("Type in your e-mail so we can send you the recovery code."),
      const SizedBox(height: 20.0),
      TextField(
        controller: _emailFieldController,
        decoration: const InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 10.0),
      Text(statusMessage),
      Row(
        children: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Back to login')),
          const Spacer(),
          ElevatedButton(
              onPressed: () => submitPasswordRecoveryMail(),
              child: const Text('Send code')),
        ],
      ),
    ]);
  }

  submitPasswordRecoveryMail() async {

    bool success = await forgotPassword(_emailFieldController.text);

    if (success && mounted) {
      setState(() {
        statusMessage = 'Password recovery has been sent! Please follow the instructions in the mail.';
      });
    }
  }
}
