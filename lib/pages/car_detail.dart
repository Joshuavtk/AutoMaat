import 'package:auto_maat/modules/dataobject/car.dart';
import 'package:auto_maat/pages/reserve.dart';
import 'package:flutter/material.dart';
import '../modules/http.dart' as custom_http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

class CarDetail extends StatelessWidget {
  const CarDetail({super.key, required this.car});


  final Car car;
  @override
  //State<CarDetail> createState() => CarDetailWidget();
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car detail page"),
      ),
      body: Column(
        children: [
          Text(car.model),
          Text(car.brand),
          Image.memory(base64Decode(car.picture)),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Reserve(restorationId: 'main'))),
              child: const Text('Reserve car')),
        ],
      ),
    );
  }
}

// class CarDetailWidget extends State<CarDetail> {
//   List<Car> cars = [];

//   @override
//   void initState() {
//     super.initState();
//     _getCars();
//   }
  
//   @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//             appBar: AppBar(
//               title: const Text('Zoek'),
//               backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//             ),
//             body: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     someOtherThing(),
//                     ElevatedButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text('terug')),
//                   ]
//                 )
//             ),
//           );
//     }

//     Widget someOtherThing() {
//       return Expanded(child: ListView(
//         padding: const EdgeInsets.all(8),
//         children: <Widget>[
//           for (Car car in cars) ...[
//           Container(
//             height: 50,
//             color: Colors.amber[600],
//             child: Center(child: Text("${car.model} ${car.brand}")),
//           ),
//         ]          
//         ],
//       ));
//     }

//   _getCars() async {
//     var temp = await custom_http.getCars();
//     setState(() {
//       cars = temp;
//     });
//   }
// }
