import 'package:flutter/material.dart';

class Zoek extends StatelessWidget {
    const Zoek({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
            appBar: AppBar(
              title: const Text('Zoek'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    someOtherThing(),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('terug')),
                  ]
                )
            ),
          );
    }

    Widget someOtherThing() {
      return Expanded(child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ));
    }
}
