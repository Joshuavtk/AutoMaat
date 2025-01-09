import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'map.dart';
import 'contact.dart';
import 'database_test.dart';
import '../database/database.dart';
import '../modules/http.dart' as custom_http;

class Idk extends StatefulWidget {
  const Idk({super.key});

  @override
  State<Idk> createState() => IdkState();
}

class IdkState extends State<Idk> {
  final database = AppDatabase();

  @override
  void initState() {
    super.initState();
    //_httpTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Http test'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: FutureBuilder(
              future: _httpTest(),
              builder: (BuildContext context, AsyncSnapshot<String> text) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(text.data ?? ""),
                      if(text.hasData) ...[
                        ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DatabaseTest())),
                          child: const Text('Doorgaan')),
                      ]                      
                    ]);
              }),
        ));
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

  Future<String> getIdToken() async {
    print("Hello");
    print(custom_http.getIpAddress());
    var body = {"username": "admin", "password": "admin", "rememberMe": "true"};

    var url = Uri.http('${custom_http.getIpAddress()}:8080', 'api/authenticate');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print("token: ${jsonDecode(response.body)['id_token']}");
    if (response.statusCode == 200) {
      print("frozen in this function?");
      var token = jsonDecode(response.body)['id_token'];
      return token;
    }
    print("done here");
    return "no token gotten...";
  }
}
