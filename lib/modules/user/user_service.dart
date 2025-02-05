import 'dart:convert';

import 'package:auto_maat/database/database.dart';
import 'package:auto_maat/modules/api/api_service.dart';
import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;

Future<bool> authenticate(username, password, rememberMe) async {
  print("start login $username + $password + $rememberMe");

  final payload = jsonEncode(<String, Object>{
    "username": username,
    "password": password,
    "rememberMe": rememberMe,
  });

  try {
    final response = await http.post(
      Uri.http(apiUrl, 'api/authenticate'),
      headers: {"Content-Type": "application/json"},
      body: payload,
    );

    // print(response);
    // print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful upload
      print('Login geslaagd...: ${response.statusCode}');
      String bearerToken = jsonDecode(response.body)['id_token'];

      AppDatabase database = AppDatabase();
      // var users = await database.getUsers();
      // print(users);
      await database.saveItem(bearerToken);

      database.close();

      return true;
    } else {
      // Handle failed upload
      //TODO: show failed login attempt error
      print('Login niet geslaagd. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // Handle any errors that occurred during the HTTP request
    // Probably means that network is offline or server cannot be reached.
    print('Error: $error');
  }

  return false;
}

Future<bool> forgotPassword(email) async {
  print("start forgot password $email");

  // final payload = jsonEncode(<String, Object>{
  //   email
  // });

  try {
    final response = await http.post(
      Uri.http(apiUrl, 'api/account/reset-password/init'),
      headers: {"Content-Type": "application/json"},
      body: email,
    );

    // print(response);
    // print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful upload
      print('Password reset success...: ${response.statusCode}');

      return true;
    } else {
      // Handle failed upload
      //TODO: show failed login attempt error
      print('Error : ${response.statusCode}');
    }
  } catch (error) {
    // Handle any errors that occurred during the HTTP request
    // Probably means that network is offline or server cannot be reached.
    print('Error: $error');
  }

  return false;
}

Future<bool> register(email, firstName, lastName, username, password) async {
  print("start register $username + $password + $email");

  final payload = jsonEncode(<String, Object>{
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "login": username,
    "password": password,
  });

  try {
    final response = await http.post(
      Uri.http(apiUrl, 'api/register'),
      headers: {"Content-Type": "application/json"},
      body: payload,
    );

    print(response);
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful upload
      print('Register geslaagd...: ${response.statusCode}');

      return true;
    } else {
      // Handle failed upload
      //TODO: show failed login attempt error
      print('Login niet geslaagd. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // Handle any errors that occurred during the HTTP request
    // Probably means that network is offline or server cannot be reached.
    print('Error: $error');
  }

  return false;
}

Future<List<RentalsCompanion>> timelineData() async {
  String token = await getUserToken();

  var url = Uri.http(apiUrl, 'api/rentals');

  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json", "Authorization": 'Bearer $token'},
  );

  print(response.statusCode);
  if (response.statusCode == 200) {
    List<RentalsCompanion> rentals = [];
    for (var item in jsonDecode(response.body)) {
      final rental = RentalsCompanion(
        id: Value(item['id']),
        state: Value(item['state']),
        fromDate: Value(DateTime.parse(item['fromDate'])),
        toDate: Value(DateTime.parse(item['toDate'])),
        longitude: Value(item['longitude']),
        latitude: Value(item['latitude']),
        code: Value(item['code']),
      );

      rentals.add(rental);
    }
    return rentals;
  } else if (response.statusCode == 401) {
    // Authorization token invalid.
  }
  //Should only happen on no network connection.
  print('Error retrieving timeline data');
  return [];
}

Future<String> getUserToken() async {
  AppDatabase database = AppDatabase();
  var users = await database.getUsers();
  database.close();

  UserData userData = users.first;
  String token = userData.token;

  return token;
}

Future<bool> changePassword(currentPassword, newPassword) async {
  String token = await getUserToken();

  final payload = jsonEncode(<String, Object>{
    "currentPassword": currentPassword,
    "newPassword": newPassword,
  });

  final response = await http.post(
    Uri.http(apiUrl, 'api/account/change-password'),
    headers: {"Content-Type": "application/json", "Authorization": 'Bearer $token'},
    body: payload,
  );

  try {
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful upload
      return true;
    }
  } catch (error) {
    // Handle any errors that occurred during the HTTP request
    print('Error: $error');
  }

  return false;
}

Future<int> uploadDamageReport(RentalsCompanion rental, String description) async {
  String token = await getUserToken();

  final payload = jsonEncode(<String, Object>{
    "code": rental.code.value,
    "description": description,
  });

  final response = await http.post(
    Uri.http(apiUrl, 'api/inspections'),
    headers: {"Content-Type": "application/json", "Authorization": 'Bearer $token'},
    body: payload,
  );

  print(response.body);
  print(response.statusCode);

  try {
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful upload
      int reportId = jsonDecode(response.body)['id'];
      return reportId;
    }
  } catch (error) {
    // Handle any errors that occurred during the HTTP request
    print('Error: $error');
  }

  return 0;
}

Future<bool> uploadImageToDamageReport(int reportId, String image) async {
  print('start upload picture');
  String token = await getUserToken();

  final payload = jsonEncode(<String, Object>{
    // "id": reportId,
    "photo": image, "photoContentType": "image/png"
  });

  final response = await http.post(
    Uri.http(apiUrl, 'api/inspection-photos'),
    headers: {"Content-Type": "application/json", "Authorization": 'Bearer $token'},
    body: payload,
  );

  print(response.body);
  print(response.statusCode);

  try {
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful upload
      // int reportId = jsonDecode(response.body)['id'];
      return true;
    }
  } catch (error) {
    // Handle any errors that occurred during the HTTP request
    print('Error: $error');
  }

  return false;
}
