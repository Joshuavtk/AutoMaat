import 'package:auto_maat/modules/user/user_service.dart';
import 'package:auto_maat/pages/forgot_password.dart';
import 'package:auto_maat/pages/register.dart';
import 'package:auto_maat/ui/login_wrapper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController = TextEditingController();
  bool checkboxValue = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    Future<bool> success;
    return loginWrapper(context, children: <Widget>[
      const Image(
        image: AssetImage('images/splash_screen.png'),
        height: 50,
      ),
      const SizedBox(height: 20.0),
      const Text(
        "Log in",
        style: TextStyle(fontSize: 32),
        textAlign: TextAlign.end,
      ),
      const Text("Log in with your AutoMaat account"),
      const SizedBox(height: 20.0),
      TextField(
        controller: _emailFieldController,
        decoration: const InputDecoration(
          labelText: 'Username',
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 20.0),
      TextField(
        controller: _passwordFieldController,
        decoration: InputDecoration(
            labelText: 'Enter your password',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: Theme.of(context).primaryColorDark,
              ),
            )),
        obscureText: _obscurePassword,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CheckboxListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                title: const Text(
                  "Remember me?",
                  style: TextStyle(fontSize: 15),
                ),
                value: checkboxValue,
                onChanged: (newValue) => setState(() {
                      checkboxValue = newValue!;
                    }),
                controlAffinity: ListTileControlAffinity.leading),
          ),
          TextButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen())),
              child: const Text('Forgot password?')),
        ],
      ),
      Row(
        children: [
          TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen())),
              child: const Text('Create account')),
          const Spacer(),
          ElevatedButton(
              onPressed: () => {authenticate(_emailFieldController.text, _passwordFieldController.text, checkboxValue)},
              child: const Text('Login')),
        ],
      ),
    ]);
  }
}
