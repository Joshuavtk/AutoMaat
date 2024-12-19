import 'package:flutter/material.dart';

Widget exampleButton(formData) {
  return ElevatedButton(
      onPressed: () => print([formData[0], formData[1]]),
      child: const Text('Log in'));
}
