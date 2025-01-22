import 'package:flutter/material.dart';

Widget fullWidthButton(BuildContext context, String title, IconData icon, Widget redirectScreen) {
  return MaterialButton(
      height: 50,
      minWidth: 1000,
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => redirectScreen)),
      child: Row(
        children: [
          Icon(icon, size: 30),
          const Padding(padding: EdgeInsets.all(15)),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ));
}
