import 'package:auto_maat/pages/account.dart';
import 'package:flutter/material.dart';
import 'map.dart';
import 'contact.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
              title: const Text('Home'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Contact())),
              child: const Text('Naar contact')),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Map())),
              child: const Text('Naar map')),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AccountScreen())),
              child: const Text('Naar account')),
        ])));
  }
}
