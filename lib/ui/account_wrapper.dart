import 'package:flutter/material.dart';

Widget accountWrapper(BuildContext context, String title, {required List<Widget> children}) {
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
        children: children,
      ));
}
