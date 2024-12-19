import 'package:flutter/material.dart';
import 'zoek.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(
              title: const Text('Map'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  ElevatedButton(
                      onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Zoek())),
                      child: const Text("Naar zoeken"))
                ])));
  }
}
