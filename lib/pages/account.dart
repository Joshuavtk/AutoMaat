import 'package:auto_maat/pages/account_edit.dart';
import 'package:auto_maat/pages/login.dart';
import 'package:auto_maat/pages/timeline.dart';
import 'package:auto_maat/ui/account_wrapper.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';
import '../ui/full_width_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return accountWrapper(context, 'Account', children: <Widget>[
      Card(
        margin: const EdgeInsets.all(10),
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
                  const Text(
                    'johndoe@gmail.com',
                    style: TextStyle(fontSize: 15),
                  ),
                  IconButton(
                      onPressed: () => print('Expand account dropdown.'),
                      icon: const Icon(
                        Icons.arrow_downward,
                        size: 30,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
      const Divider(
        endIndent: 10,
        indent: 10,
        height: 20,
      ),
      fullWidthButton(context, 'Timeline', Icons.history, const TimelineScreen()),
      fullWidthButton(context, 'Edit account', Icons.manage_accounts_outlined, const AccountEditScreen()),
      MaterialButton(
          height: 50,
          minWidth: 1000,
          onPressed: () => logout(),
          child: const Row(
            children: [
              Icon(Icons.logout, size: 30),
              Padding(padding: EdgeInsets.all(15)),
              Text(
                "Logout from account",
                style: TextStyle(fontSize: 16),
              )
            ],
          )),
      fullWidthButton(context, 'Support', Icons.help_outline, const TimelineScreen()),
      fullWidthButton(context, 'App info', Icons.info_outline, const TimelineScreen()),
    ]);
  }

  logout() async {
    AppDatabase database = AppDatabase();
    await database.deleteUserToken();
    database.close();

    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }
}
