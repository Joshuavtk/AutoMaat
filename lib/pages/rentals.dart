import 'package:auto_maat/modules/dataobject/rental.dart';
import 'package:auto_maat/pages/car_detail.dart';
import 'package:flutter/material.dart';
import '../modules/http.dart' as custom_http;

class Rentals extends StatefulWidget {
  const Rentals({super.key});

  @override
  State<Rentals> createState() => RentalsWidget();
}

class RentalsWidget extends State<Rentals> {
  List<Rental> rentals = [];

  @override
  void initState() {
    super.initState();
    _getRentals();
  }
  
  @override
    Widget build(BuildContext context) {
      return Scaffold(
            appBar: AppBar(
              title: const Text('Rentals'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getRentalWidgets(),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('terug')),
                  ]
                )
            ),
          );
    }

    Widget getRentalWidgets() {
      return Expanded(child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          for (Rental rental in rentals) ...[
          ListTile(
            title: Text("${rental.id} ${rental.code} ${rental.state}"),            
          ),
        ]          
        ],
      ));
    }

  _getRentals() async {
    var temp = await custom_http.getRentals(2);
    setState(() {
      rentals = temp;
    });
  }
}
