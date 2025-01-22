import 'package:auto_maat/ui/account_wrapper.dart';
import 'package:flutter/material.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelineScreen> {
  @override
  Widget build(BuildContext context) {
    return accountWrapper(context, 'Timeline', children: <Widget>[
      Card(
        margin: const EdgeInsets.all(10),
        child: Container(
          width: 1000,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rental 25 November 2024",
                style: TextStyle(fontSize: 18),
              ),
              Text("€25,-"),
              Text("14:00 - 17:00"),
              Text("Nissan Micra V2.10"),
            ],
          ),
        ),
      ),
    ]);
  }
}
