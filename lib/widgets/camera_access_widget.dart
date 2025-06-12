import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraAccessWidget extends StatelessWidget {
  const CameraAccessWidget({super.key});

  Future<void> _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.camera);
    // No need to save or show image.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Camera opened. Image not saved.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.camera_alt, size: 80, color: Colors.grey),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () => _openCamera(context),
          icon: const Icon(Icons.camera),
          label: const Text('Open Camera'),
        ),
        const SizedBox(height: 20),
        const Text(
          '📷 Image uploading feature coming soon with more features!',
          style: TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
