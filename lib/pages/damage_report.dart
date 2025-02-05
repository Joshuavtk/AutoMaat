import 'dart:async';
import 'dart:convert';

import 'package:auto_maat/database/database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../modules/user/user_service.dart';
import '../ui/account_wrapper.dart';
import '../ui/photo_gallery.dart';

class DamageReportScreen extends StatefulWidget {
  const DamageReportScreen({super.key, required this.rental});

  final RentalsCompanion rental;

  @override
  State<StatefulWidget> createState() => _DamageReportState();
}

class _DamageReportState extends State<DamageReportScreen> {
  final TextEditingController _descriptionFieldController = TextEditingController();
  String statusMessage = "";

  List<XFile> uploadedImages = [];

  @override
  Widget build(BuildContext context) {
    return accountWrapper(context, 'Report damage', togglePadding: true, children: [
      const Text(
        'Reporting damage for trip:',
        style: TextStyle(fontSize: 18),
      ),
      Card(
        child: Container(
          width: 1000,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rental ${widget.rental.id.value}",
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                  "${DateFormat("MMMM d, y").format(widget.rental.fromDate.value)} - ${DateFormat("MMMM d, y").format(widget.rental.toDate.value)}"),
              Text(
                "State: ${widget.rental.state.value}",
              ),
              Text("Code: ${widget.rental.code.value}"),
            ],
          ),
        ),
      ),
      const Divider(
        height: 20,
      ),
      const Text(
        'Describe the damage',
        style: TextStyle(fontSize: 18),
      ),
      TextField(
        controller: _descriptionFieldController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(
          labelText: 'Description',
          border: OutlineInputBorder(),
        ),
      ),
      const Divider(
        height: 30,
      ),
      const Text(
        'Add pictures of the damage',
        style: TextStyle(fontSize: 18),
      ),
      Row(
        children: [
          ElevatedButton(onPressed: () => openCamera(), child: const Text('Take new picture')),
          ElevatedButton(onPressed: () => openGallery(), child: const Text('Upload existing picture')),
        ],
      ),
      uploadedImages.isEmpty ? const Center(child: Text('No images selected')) : PhotoGallery(images: uploadedImages),
      const SizedBox(
        height: 10.0,
      ),
      FilledButton(onPressed: () => submitReport(), child: const Text('Submit report')),
      Text(
        statusMessage,
      ),
    ]);
  }

  openCamera() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (photo != null) {
        uploadedImages.addAll([photo]);
      }
    });
  }

  openGallery() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final List<XFile> images = await picker.pickMultiImage();

    setState(() {
      uploadedImages.addAll(images);
    });
  }

  void _showLoadingDialog(Stream<int> progressStream, int totalCount) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StreamBuilder<int>(
          stream: progressStream, // Listen to progress updates
          builder: (context, snapshot) {
            int progress = snapshot.data ?? 0;

            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(value: progress / totalCount),
                    const SizedBox(height: 16),
                    Text("Uploading: Image $progress out of $totalCount"),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  submitReport() async {
    final StreamController<int> progressController = StreamController<int>();

    _showLoadingDialog(progressController.stream, uploadedImages.length); // Show loading dialog

    int reportId = await uploadDamageReport(widget.rental, _descriptionFieldController.text);

    print('created report with id $reportId');
    if (reportId != 0) {
      int imageCount = 0;
      for (XFile image in uploadedImages) {
        List<int> imageBytes = await image.readAsBytes();

        // Convert bytes to Base64 string
        String base64String = base64Encode(imageBytes);
        await uploadImageToDamageReport(reportId, base64String);
        print('uploaded picture');
        imageCount += 1;
        progressController.add(imageCount);
      }

      setState(() {
        statusMessage = "Report successfully created!";
        uploadedImages.clear();
        _descriptionFieldController.clear();
      });
    }
    if (mounted) {
      Navigator.pop(context);
    }
  }
}
