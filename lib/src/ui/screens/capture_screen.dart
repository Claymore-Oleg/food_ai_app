import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';

class CaptureScreen extends StatelessWidget {
  const CaptureScreen({super.key});

  Future<void> _takePhoto(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? shot = await picker.pickImage(source: ImageSource.camera);

    if (shot != null) {
      // Переходим на экран /result и передаём путь к файлу
      context.go('/result', extra: File(shot.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capture')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => _takePhoto(context),
          icon: const Icon(Icons.camera_alt),
          label: const Text('Take photo'),
        ),
      ),
    );
  }
}