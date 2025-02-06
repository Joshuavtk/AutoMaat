import 'dart:io';

import 'package:auto_maat/ui/account_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoScreen extends StatefulWidget {
  const AppInfoScreen({super.key});

  @override
  State<AppInfoScreen> createState() => _AppInfoScreenState();
}

class _AppInfoScreenState extends State<AppInfoScreen> {
  String version = "";
  String buildNumber = "";

  @override
  void initState() {
    super.initState();
    getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return accountWrapper(context, 'App info', togglePadding: true, children: <Widget>[
      const Text(
        "Platform version",
        style: TextStyle(fontSize: 18),
      ),
      Text(Platform.version),
      const Divider(
        height: 20,
      ),
      const Text(
        "App version",
        style: TextStyle(fontSize: 18),
      ),
      Text(version),
      const Divider(
        height: 20,
      ),
      const Text(
        "Build number",
        style: TextStyle(fontSize: 18),
      ),
      Text(buildNumber),
    ]);
  }

  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }
}
