import 'package:auto_maat/modules/dataobject/car.dart';
import 'package:auto_maat/pages/car_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'zoek.dart';
import 'package:auto_maat/modules/http.dart' as custom_http;

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
  List<Car> cars = [];
  var beginLat = 53.238316;
  var beginLong = 6.53497;
  double currentZoom = 16.0;
  LatLng currentCenter = const LatLng(53.238316, 6.53497);
  final LayerHitNotifier hitNotifier = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _initLocation();
    _getCars();
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
      beginLat = _locationData?.latitude ?? beginLat;
      beginLong = _locationData?.longitude ?? beginLong;
      //cheating:
      beginLat = 53.238316;
      beginLong = 6.53497;
      
      currentCenter = LatLng(beginLat, beginLong);
      mapController.move(  
        currentCenter,
        currentZoom,
      );
    });
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
          ],
        ));
  }

  Widget _getMapWidget() {
    return FlutterMap(
        mapController: mapController,
        options: const MapOptions(
          initialCenter: LatLng(53.238316, 6.53497),
          initialZoom: 5,
          interactionOptions: InteractionOptions(flags: InteractiveFlag.doubleTapDragZoom | InteractiveFlag.doubleTapZoom | InteractiveFlag.drag | InteractiveFlag.flingAnimation | InteractiveFlag.pinchMove | InteractiveFlag.pinchZoom | InteractiveFlag.scrollWheelZoom)
        ),
        children: [
          _getMapLayer(),
          _getCarPointersLayer(),
          //_getCurrentPositionLayer(),
        ]);
  }

  Widget _getMapLayer() {
    return TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.app',
    );
  }

  Widget _getCarPointersLayer() {
    return GestureDetector(
    onTap: () {
      Car car = hitNotifier.value!.hitValues.first as Car;
      Navigator.push(context, MaterialPageRoute(
            builder: (context) => CarDetail(car: car),
            ));
    },
    child: CircleLayer(
      hitNotifier: hitNotifier,
      circles: [
        for (Car car in cars) ...[
          CircleMarker(
            point: LatLng(car.latitude, car.longitude),
            radius: 30,
            useRadiusInMeter: true,
            hitValue: car,
          ),
        ],
      ],
    )
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

  _getCars() async {
    var temp = await custom_http.getCars();
    setState(() {
      cars = temp;
    });
  }
}
