import 'package:auto_maat/modules/dataobject/car.dart';
import 'package:auto_maat/pages/car_detail.dart';
import 'package:flutter/material.dart';
import '../modules/http.dart' as custom_http;

class Zoek extends StatefulWidget {
  const Zoek({super.key});

  @override
  State<Zoek> createState() => ZoekWidget();
}

class ZoekWidget extends State<Zoek> {
  List<Car> cars = [];

  @override
  void initState() {
    super.initState();
    _getCars();
  }
  
  @override
    Widget build(BuildContext context) {
      return Scaffold(
            appBar: AppBar(
              title: const Text('Zoek'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    someOtherThing(),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('terug')),
                  ]
                )
            ),
          );
    }

    Widget someOtherThing() {
      return Expanded(child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          for (Car car in cars) ...[
          ListTile(
            title: Text("${car.model} ${car.brand}"),
            onTap: (){ Navigator.push(context, MaterialPageRoute(
            builder: (context) => CarDetail(car: car),
            ));},
            
          ),
        ]          
        ],
      ));
    }

  _getCars() async {
    var temp = await custom_http.getCars();
    setState(() {
      cars = temp;
    });
  }
}
