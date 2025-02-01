import 'package:auto_maat/pages/register_completed.dart';
import 'package:flutter/material.dart';

import '../modules/user/user_service.dart';
import '../ui/login_wrapper.dart';

class RegisterFinishScreen extends StatefulWidget {
  const RegisterFinishScreen({super.key, required this.email, required this.password});

  final String email;
  final String password;

  @override
  State<StatefulWidget> createState() => _RegisterFinishPageState();
}

class _RegisterFinishPageState extends State<RegisterFinishScreen> {
  final TextEditingController _firstNameFieldController = TextEditingController();
  final TextEditingController _lastNameFieldController = TextEditingController();
  final TextEditingController _usernameFieldController = TextEditingController();
  String statusMessage = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    // print(context);
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
      const Text("Finish registering your account"),
      const SizedBox(height: 20.0),
      TextField(
        controller: _firstNameFieldController,
        decoration: const InputDecoration(
          labelText: 'First name',
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _lastNameFieldController,
        decoration: const InputDecoration(
          labelText: 'Last name',
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _usernameFieldController,
        decoration: const InputDecoration(
          labelText: 'Username',
          border: OutlineInputBorder(),
        ),
      ),
      Text(
        statusMessage,
        style: const TextStyle(color: Colors.red),
      ),
      const SizedBox(height: 10.0),
      Row(
        children: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Go back')),
          const Spacer(),
          ElevatedButton(onPressed: () => registerPressed(), child: const Text('Create account')),
        ],
      ),
    ]);
  }

  registerPressed() async {
    // print(
    //     'Register with email: ${widget.email} pw: ${widget.password} fn: ${_firstNameFieldController.text} ln:${_lastNameFieldController.text} un: ${_usernameFieldController.text}');
    if (loading) {
      return null;
    }

    setState(() {
      loading = true;
      statusMessage = "";
    });

    if (_firstNameFieldController.text == '' ||
        _lastNameFieldController.text == '' ||
        _usernameFieldController.text == '') {
      setState(() {
        statusMessage = 'Error creating account, fields may not be empty';
        loading = false;
      });
      return false;
    }

    var success = await register(widget.email, _firstNameFieldController.text, _lastNameFieldController.text,
        _usernameFieldController.text, widget.password);

    setState(() {
      loading = false;
    });
    if (mounted && success) {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => const RegisterCompleted()), (route) => false);
    } else {
      setState(() {
        statusMessage = 'Error logging in, incorrect login data.';
      });
    }
  }
}
