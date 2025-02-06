import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:auto_maat/modules/dataobject/car.dart';
import 'package:auto_maat/pages/car_detail.dart';
import 'package:flutter/material.dart';
import '../modules/http.dart' as custom_http;

class InternetCheck extends StatefulWidget {
  const InternetCheck({super.key});

  @override
  State<InternetCheck> createState() => InternetCheckWidget();
}

class InternetCheckWidget extends State<InternetCheck> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InternetCheck'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  bool result = await InternetConnection().hasInternetAccess;
                  if (result) {
                    const snackBar = SnackBar(content: Text('You are online'));
                    _showsnackbar(snackBar);
                  } else {
                    const snackBar = SnackBar(content: Text('You are oflline'));
                    _showsnackbar(snackBar);
                  }
                },
                child: const Text('check internet connection')),
          ])),
    );
  }

  _showsnackbar(snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
