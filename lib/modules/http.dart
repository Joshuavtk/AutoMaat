import 'package:auto_maat/modules/api/api_service.dart';
import 'package:auto_maat/modules/dataobject/customer.dart';
import 'package:auto_maat/modules/dataobject/rental.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:auto_maat/modules/dataobject/car.dart';

Future<String> getIdToken() async {
    print("vergeet niet de windows firewall uit te zetten");
    print("anders lijkt het alsof het niet werkt...");
    var body = {"username": "admin", "password": "admin", "rememberMe": "true"};

    var url = Uri.http(apiUrl, 'api/authenticate');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    if (response.statusCode == 200) {
      var token = jsonDecode(response.body)['id_token'];
      return token;
    }
    return "error getting token";
  }

Future<List<Car>> getCars() async {
    String token = await getIdToken();
    var url =
        Uri.http(apiUrl, 'api/cars');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return List.from(body.map((json) => Car.fromJson(json)));
    }

    throw Exception('Error loading cars');
  }

  Future<List<Rental>> getRentals(int userId) async {
    print(userId);
    String token = await getIdToken();
    var url =
        Uri.http(apiUrl, 'api/rentals?customerId.equals=$userId');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return List.from(body.map((json) => Rental.fromJson(json)));
    }

    throw Exception('Error loading rentals for user: $userId');
  }

Future<List<Rental>> postReserve(dynamic body) async {
    String token = await getIdToken();
    var url =
        Uri.http(apiUrl, 'api/rentals');
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 201) {
      final body = jsonDecode(response.body);
      //print(body);
      return List.from(body.map((json) => Rental.fromJson(json)));
    }
    throw Exception('Error failed to post reserve');
  }