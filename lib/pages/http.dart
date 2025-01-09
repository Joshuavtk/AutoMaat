import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'map.dart';
import 'contact.dart';
import 'database_test.dart';
import '../database/database.dart';
import '../modules/http.dart' as custom_http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final database = AppDatabase();
  String token = "nog geen token";

  @override
  void initState() {
    super.initState();
    _getToken();
  }

_getToken() async {
  String temp = await custom_http.getIdToken();
  setState(() {
      token = temp;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http test'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(token),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DatabaseTest())),
                child: const Text('Doorgaan')),
          ],
        ),
      ),
    );
  }

  Future<String> _httpTest() async {
    print("Hello");
    var body = {"username": "admin", "password": "admin", "rememberMe": "true"};

    var url = Uri.http('192.168.178.143:8080', 'api/authenticate');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print("token: ${jsonDecode(response.body)['id_token']}");
    await database.saveItem(jsonDecode(response.body)['id_token']);
    database.close();
    print("done here");
    //print(await http.read(Uri.https('example.com', 'foobar.txt')));
    return "done with http test.";
  }
}
