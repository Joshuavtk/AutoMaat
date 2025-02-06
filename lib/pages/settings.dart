import 'package:auto_maat/ui/account_wrapper.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = ["EN", "NL", "DE", "BE"];

    return accountWrapper(context, 'Settings', togglePadding: true, children: <Widget>[
      const Text(
        "Change app language",
        style: TextStyle(fontSize: 18),
      ),
      DropdownButton(
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (_) => print('change language'),
        value: items.first,
      )
    ]);
  }
}
