import 'package:auto_maat/pages/login.dart';
import 'package:flutter/material.dart';

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
                child: Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.tertiaryContainer,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            Row(
              children: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Back to login')),
                const Spacer(),
                ElevatedButton(
                    onPressed: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
                    child: const Text('Send code')),
              ],
            ),
          ]),
    ))));
  }
}
