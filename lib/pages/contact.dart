import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Support / Contact'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: const DecorationImage(
                    image: NetworkImage('https://bioinf.nl/~bbarnard/kip.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(150.0)),
                  border: Border.all(
                    color: Colors.green,
                    width: 4.0,
                  ))),
          ElevatedButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Terug')),
        ])));
  }
}
