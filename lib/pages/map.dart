import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'zoek.dart';
import 'dart:developer';
import 'dart:convert';
import '../modules/http.dart' as custom_http;

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => MapWidget();
}

class MapWidget extends State<Map> {
  MapController mapController = MapController();
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  List<LatLng> carLocations = [];
  var beginLat = 53.238316;
  var beginLong = 6.53497;
  double currentZoom = 16.0;
  LatLng currentCenter = const LatLng(53.238316, 6.53497);
  @override
  void initState() {
    super.initState();
    _initLocation();
    _getCarLocations();
  }

  _initLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      log(_locationData.toString());
      beginLat = _locationData?.latitude ?? beginLat;
      beginLong = _locationData?.longitude ?? beginLong;
      currentCenter = LatLng(beginLat, beginLong);
      mapController.move(  
        currentCenter,
        currentZoom,
      );
    });
  }

  void _zoomIn() {
    currentZoom = currentZoom + 1;
    mapController.move(currentCenter, currentZoom);
  }

  void _zoomOut() {
    currentZoom = currentZoom - 1;
    mapController.move(currentCenter, currentZoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Map'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Zoek())),
                child: const Text("Naar zoeken"))
          ],
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            _getMapWidget(),
            Column(
              children: [
                FloatingActionButton(
                  onPressed: _zoomIn,
                  tooltip: 'ZoomIn',
                  child: const Icon(Icons.add_circle_rounded),
                ),
                FloatingActionButton(
                  onPressed: _zoomOut,
                  tooltip: 'ZoomOut',
                  child: const Icon(Icons.remove_circle_outline_rounded),
                ),
              ],
            )
          ],
        ));
  }

  Widget _getMapWidget() {
    return FlutterMap(
        mapController: mapController,
        options: const MapOptions(
          initialZoom: 5,
        ),
        children: [
          _getMapLayer(),
          _getCarPointersLayer(),
          _getCurrentPositionLayer(),
        ]);
  }

  Widget _getMapLayer() {
    return TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.app',
    );
  }

  Widget _getCarPointersLayer() {
    print("carLocations: $carLocations");

    return CircleLayer(
      circles: [
        for (LatLng carLocation in carLocations) ...[
          CircleMarker(
            point: carLocation,
            radius: 30,
            useRadiusInMeter: true,
          ),
        ]
      ],
    );
  }

  Widget _getCurrentPositionLayer() {
    return CircleLayer(
      circles: [
          CircleMarker(
            point: LatLng(beginLat, beginLong),      
            radius: 30,
            useRadiusInMeter: true,
            color: const Color.fromRGBO(255, 0, 0, 1),
            borderColor: const Color.fromRGBO(255, 0, 0, 1),
          ),
      ],
    );
  }

  _getCarLocations() async {
    var temp = await custom_http.getCarLocations();
    setState(() {
      carLocations = temp;
    });
  }
}
