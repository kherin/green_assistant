import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class LensPage extends StatefulWidget {
  const LensPage(
    this.camera,
  ) : super();

  final CameraDescription camera;

  @override
  LensPageState createState() => LensPageState();
}

class LensPageState extends State<LensPage> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a picture'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _controller.initialize();
            final image = _controller.takePicture("../output/img/file1.png");
            print(image);
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
