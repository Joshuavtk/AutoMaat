import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:auto_maat/modules/api/api_service.dart';

Future<String> authenticate(username, password, rememberMe) async {

  print("start login $username + $password + $rememberMe");

  final payload = jsonEncode(<String, Object>{
    "username": username,
    "password": password,
    "rememberMe": rememberMe,
  });

  final response = await http.post(
      Uri.parse('http://localhost:8080/api/authenticate'),
      headers: {"Content-Type": "application/json"},
      body: payload,
  );

  print(response);
  print(response.body);

  try {
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful upload
      print('Login geslaagd...: ${response.statusCode}');
      print(jsonDecode(response.body)['id_token']);
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