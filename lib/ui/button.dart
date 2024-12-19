import 'package:flutter/material.dart';

Widget exampleButton() {
  return ElevatedButton(
      onPressed: () => print('Example button pressed'),
      child: const Text('Klik op deze knop!'));
}
