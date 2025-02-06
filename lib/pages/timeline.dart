import 'package:auto_maat/modules/user/user_service.dart';
import 'package:auto_maat/pages/damage_report.dart';
import 'package:auto_maat/ui/account_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../database/database.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelineScreen> {
  List<Widget> timeline = [];
  bool loadData = false;

  @override
  Widget build(BuildContext context) {
    if (!loadData) {
      timelineRecord();
      loadData = true;
    }

    return accountWrapper(context, 'Timeline', children: timeline);
  }

  timelineRecord() async {
    List<Widget> records = [];
    List<RentalsCompanion> data = await timelineData();

    for (RentalsCompanion rental in data) {
      records.add(Card(
        margin: const EdgeInsets.all(10),
        child: Container(
          width: 1000,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rental ${rental.id.value}",
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                  "${DateFormat("MMMM d, y").format(rental.fromDate.value)} - ${DateFormat("MMMM d, y").format(rental.toDate.value)}"),
              Text(
                "State: ${rental.state.value}",
              ),
              Text("Code: ${rental.code.value}"),
              OutlinedButton(onPressed: () => goToDamageReportScreen(rental), child: const Text('Report damage'))
            ],
          ),
        ),
      ));
    }
    setState(() {
      timeline = records;
    });
  }

  goToDamageReportScreen(RentalsCompanion rentalData) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DamageReportScreen(rental: rentalData)));
  }
}
