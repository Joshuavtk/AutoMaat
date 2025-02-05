import 'package:auto_maat/modules/dataobject/car.dart';
import 'package:auto_maat/modules/dataobject/customer.dart';
import 'package:auto_maat/modules/dataobject/rental.dart';
import 'package:auto_maat/pages/rentals.dart';
import 'package:flutter/material.dart';
import 'package:auto_maat/modules/http.dart' as custom_http;
import 'package:auto_maat/modules/json.dart' as custom_json;

class Reserve extends StatefulWidget {
  const Reserve({super.key, required this.car, this.restorationId});

  final String? restorationId;
  final Car car;

  @override
  State<Reserve> createState() => _ReserveState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _ReserveState extends State<Reserve>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;
  Car get car => widget.car;

  final RestorableDateTime _selectedToDate = RestorableDateTime(DateTime.now());
  final RestorableDateTime _selectedFromDate =
      RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?>
      _restorableFromDatePickerRouteFuture = RestorableRouteFuture<DateTime?>(
    onComplete: _selectFromDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedToDate.value.millisecondsSinceEpoch,
      );
    },
  );
  late final RestorableRouteFuture<DateTime?>
      _restorableToDatePickerRouteFuture = RestorableRouteFuture<DateTime?>(
    onComplete: _selectToDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedToDate.value.millisecondsSinceEpoch,
      );
    },
  );
  Rental rental = Rental.fromJson({
    "id": 1,
  "code": "license vicinity mixture",
  "longitude": 5464.4,
  "latitude": 26248.48,
  "fromDate": "",
  "toDate": "",
  "state": "RESERVED",
    });
  Customer customer = Customer.fromJson({
    "id": 2,
    "nr": 1002,
    "lastName": "Johnson",
    "firstName": "Emily",
    "from": "2019-02-10"
  });
  
  @override
  void initState() {
    super.initState();
    var i = getRentals();
    //print(i);
    print(car.id);
    print(car.model);
    print(car.body);
  }

  getRentals() async {
    var temp = await custom_http.getRentals(customer.id);
    return temp;
  }

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    DateTime date = DateTime.now();
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          currentDate: date,
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          firstDate: date,
          lastDate: DateTime(date.year + 1, date.month, date.day),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedFromDate, 'selected_from_date');
    registerForRestoration(_selectedToDate, 'selected_to_date');
    registerForRestoration(
        _restorableFromDatePickerRouteFuture, 'from_date_picker_route_future');
    registerForRestoration(
        _restorableToDatePickerRouteFuture, 'to_date_picker_route_future');
  }

  void _selectFromDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        int d = newSelectedDate.day;
        int m = newSelectedDate.month;
        String day = "$d";
        String month = "$m";
      if(d < 10){
        day = "0$d";
      }

      if(m < 10){
        month = "0$m";
      }

        rental.fromDate = "${newSelectedDate.year}-${month}-${day}";
      });
    }
  }

  void _selectToDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        int d = newSelectedDate.day;
        int m = newSelectedDate.month;
        String day = "$d";
        String month = "$m";
      if(d < 10){
        day = "0$d";
      }

      if(m < 10){
        month = "0$m";
      }

        rental.toDate = "${newSelectedDate.year}-${month}-${day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car reserve page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: OutlinedButton(
            onPressed: () {
              _restorableFromDatePickerRouteFuture.present();
            },
            child: Text('From: ${rental.fromDate}'),
          ),
        ),
        Center(
          child: OutlinedButton(
            onPressed: () {
              _restorableToDatePickerRouteFuture.present();
            },
            child: Text('To: ${rental.toDate}'),
          ),
        ),Center(
          child: OutlinedButton(
            onPressed: () {
              reserve();
            },
            child: const Text('Reserve'),
          ),
        ),
      ]),
    );
  }

  reserve() {
    dynamic json = custom_json.rentalToJsonWithoutId(rental, customer, car);
    Future done = custom_http.postReserve(json);
    done.then((dynamic) {
      if(mounted){
        Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Rentals()));
      }
    });
  }
}
