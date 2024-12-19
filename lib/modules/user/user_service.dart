import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> authenticate(username, password, rememberMe) async {

  final payload = jsonEncode(<String, Object>{
    "username": "test",
    "password": "test",
    "rememberMe": true,
  });

  final response = await http.post(
      Uri.parse('http://localhost:8080/api/authenticate'),
      body: payload
  );

  print(response);

  try {
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful upload
      print('Login geslaagd...: ${response.statusCode}');
    } else {
      // Handle failed upload
      print('Login niet geslaagd. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // Handle any errors that occurred during the HTTP request
    print('Error: $error');
  }

  return "Token...";
}