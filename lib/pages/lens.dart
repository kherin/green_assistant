import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// local imports
import 'package:green_assistant/services/camera.dart';
import 'package:green_assistant/constants/models.dart';
import 'package:green_assistant/services/models.dart';

class LensPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  LensPage(this.cameras);

  @override
  _LensPageState createState() => new _LensPageState();
}

class _LensPageState extends State<LensPage> {
  String _model = ssd;

  @override
  void initState() {
    super.initState();
    ModelController.loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    print(recognitions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Camera(
            widget.cameras,
            _model,
            setRecognitions,
          )
        ],
      ),
    );
  }
}
