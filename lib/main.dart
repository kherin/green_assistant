import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// local imports
import 'package:green_assistant/pages/lens.dart';

List<CameraDescription> cameras;
final firstCamera = cameras.first;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new GreenAssistantApp());
}

class GreenAssistantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Assistant',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: LensPage(firstCamera),
    );
  }
}
