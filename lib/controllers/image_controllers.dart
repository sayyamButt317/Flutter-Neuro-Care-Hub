import 'package:get/get.dart';
import 'package:tflite/tflite.dart';

class BrainTumorImageDetector extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadModel();
  }

  Future<void> loadModel() async {
    String? res = await Tflite.loadModel(
      model: 'assets/brain_tumor_detector.tflite',
      labels: 'assets/labels.txt',
    );
    print(res);
  }

  Future<Map<String, dynamic>> predict(String imagePath) async {
    var output = await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    if (output != null && output.isNotEmpty) {
      return {'result': output[0]['label']};
    } else {
      return {'result': 'Error in prediction'};
    }
  }

  @override
  void onClose() {
    Tflite.close();
    super.onClose();
  }
}
