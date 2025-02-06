import 'package:auto_maat/ui/account_wrapper.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';
import '../modules/user/user_service.dart';

class AccountEditScreen extends StatefulWidget {
  const AccountEditScreen({super.key, required this.userData});

  final UserData userData;

  @override
  State<StatefulWidget> createState() => _AccountEditPageState();
}

class _AccountEditPageState extends State<AccountEditScreen> {
  final TextEditingController _currentPasswordFieldController = TextEditingController();
  final TextEditingController _newPasswordFieldController = TextEditingController();
  String statusMessage = '';
  String errorMessage = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return accountWrapper(context, 'Account edit', children: [
      Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.person,
                          size: 30,
                        ),
                        Text(
                          widget.userData.email,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const Text(
                          '',
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 20,
            ),
            const Text(
              "Change password",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 15.0),
            TextField(
              controller: _currentPasswordFieldController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Current password', border: const OutlineInputBorder(), errorText: errorMessage),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _newPasswordFieldController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'New password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(statusMessage),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(onPressed: () => changePasswordPressed(), child: const Text('Save changes')),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  changePasswordPressed() async {
    if (loading) {
      return null;
    }

    setState(() {
      loading = true;
      statusMessage = "";
      errorMessage = "";
    });

    if (_currentPasswordFieldController.text == '' || _newPasswordFieldController.text == '') {
      setState(() {
        statusMessage = 'Error changing password, fields may not be empty';
        loading = false;
      });
      return false;
    }
    var success = await changePassword(_currentPasswordFieldController.text, _newPasswordFieldController.text);

    String result = "";
    if (mounted && success) {
      result = 'Password changed successfully!';
    } else {
      result = 'Error changing password, please check fields above';
      setState(() {
        errorMessage = "Incorrect password";
      });
    }

    setState(() {
      loading = false;
      statusMessage = result;
    });
  }
}
