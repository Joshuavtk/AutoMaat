import 'dart:convert';

import 'package:auto_maat/database/database.dart';
import 'package:auto_maat/modules/api/api_service.dart';
import 'package:http/http.dart' as http;

Future<bool> authenticate(username, password, rememberMe) async {
  print("start login $username + $password + $rememberMe");

  final payload = jsonEncode(<String, Object>{
    "username": username,
    "password": password,
    "rememberMe": rememberMe,
  });

  final response = await http.post(
    Uri.http(apiUrl, 'api/authenticate'),
    headers: {"Content-Type": "application/json"},
    body: payload,
  );

  print(response);
  print(response.body);

  try {
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful upload
      print('Login geslaagd...: ${response.statusCode}');
      String bearerToken = jsonDecode(response.body)['id_token'];

      AppDatabase database = AppDatabase();
      // var users = await database.getUsers();
      // print(users);
      database.saveItem(bearerToken);

      // Redirect to Home screen
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()))

      return true;
    } else {
      // Handle failed upload
      print('Login niet geslaagd. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // Handle any errors that occurred during the HTTP request
    print('Error: $error');
  }

  return false;
}
