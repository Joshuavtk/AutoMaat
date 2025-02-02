import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../ui/account_wrapper.dart';
import 'camera_screen.dart';

class DamageReportScreen extends StatefulWidget {
  const DamageReportScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DamageReportState();
}

class _DamageReportState extends State<DamageReportScreen> {
  // final TextEditingController _currentPasswordFieldController = TextEditingController();
  // final TextEditingController _newPasswordFieldController = TextEditingController();
  // String statusMessage = '';
  // String errorMessage = '';
  // bool loading = false;

  @override
  Widget build(BuildContext context) {
    return accountWrapper(context, 'Report damage',
        children: [ElevatedButton(onPressed: () => openCamera(), child: const Text('Open camera'))]);
  }

  openCamera() async {
    try {
      final cameras = await availableCameras();

      final firstCamera = cameras.first;

      if (mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TakePictureScreen(camera: firstCamera,)));
      }
    }
    catch (err) {
      print(err);
    }

  }
}
