import 'package:tflite/tflite.dart';

class ModelController {
  static void loadModel() async {
    await Tflite.loadModel(
      model: "assets/ssd_mobilenet.tflite",
      labels: "assets/ssd_mobilenet.txt",
    );
  }
}
