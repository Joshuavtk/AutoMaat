import 'package:auto_maat/ui/account_wrapper.dart';
import 'package:flutter/material.dart';

class AccountEditScreen extends StatefulWidget {
  const AccountEditScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AccountEditPageState();
}

class _AccountEditPageState extends State<AccountEditScreen> {
  @override
  Widget build(BuildContext context) {
    return accountWrapper(context, 'Account edit', children: <Widget>[
      const Text("Account edit"),
    ]);
  }
}
