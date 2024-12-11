import 'package:flutter/material.dart';

Widget _exampleButton() {
  return ElevatedButton(
      onPressed: () => print('Example button pressed'),
      child: const Text('Klik op deze knop!'));
}
