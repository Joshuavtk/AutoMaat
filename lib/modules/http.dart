import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:latlong2/latlong.dart';

Future<String> getIdToken() async {
    print("vergeet niet de windows firewall uit te zetten");
    print("anders lijkt het alsof het niet werkt...");
    print(getIpAddress());
    var body = {"username": "admin", "password": "admin", "rememberMe": "true"};

    var url = Uri.http('${getIpAddress()}:8080', 'api/authenticate');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    if (response.statusCode == 200) {
      var token = jsonDecode(response.body)['id_token'];
      return token;
    }
    return "een fout ofzo...";
  }

String getIpAddress() {
    // 192.168.178.143
    // 192.168.1.137
    return "192.168.178.143";
}

Future<List<LatLng>> getCarLocations() async {
    String token = await getIdToken();
    List<LatLng> carLocations = [];
    var url =
        Uri.http('${getIpAddress()}:8080', 'api/cars');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      for (var car in jsonDecode(response.body)) {
        carLocations.add(LatLng(car["latitude"], car["longitude"]));
      }
      return carLocations;
    }
    return carLocations;
  }