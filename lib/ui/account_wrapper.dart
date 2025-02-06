import 'package:flutter/material.dart';

Widget accountWrapper(BuildContext context, String title,
    {required List<Widget> children, bool togglePadding = false}) {
  return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(togglePadding ? 15 : 0),
        children: children,
      ));
}
