import 'dart:io';
import 'package:get/get.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class BrainTumorImageDetector extends GetxController {
  late Interpreter _interpreter;

  @override
  void onInit() async {
    super.onInit();
    _interpreter = await Interpreter.fromAsset('assets/tf_braintumor.tflite');
  }

  Future<Map<String, dynamic>> predict(String imagePath) async {
    // Load and preprocess image
    var image = img.decodeImage(File(imagePath).readAsBytesSync())!;
    image = img.copyResize(image, width: 224, height: 224); 

    var input = _preprocessImage(image);

    // Get output shape
    var outputShape = _interpreter.getOutputTensor(0).shape;
    var output = List.filled(outputShape[1], 0).reshape([1, outputShape[1]]);

    // Run inference
    _interpreter.run(input, output);

    // Interpret results
    var probability = output[0][0]; 
    var result = probability > 0.5 ? 'Tumor' : 'No Tumor';

    return {'result': result, 'probability': probability};
  }

  List<List<List<double>>> _preprocessImage(img.Image image) {
    var input = List.generate(
      224,
      (i) => List.generate(224, (j) => List.generate(3, (k) => 0.0)),
    );

    for (var y = 0; y < 224; y++) {
      for (var x = 0; x < 224; x++) {
        var pixel = image.getPixel(x, y);

        // Assuming your model expects RGB input, normalize to 0-1 range
        input[y][x][0] = img.getRed(pixel) / 255.0;
        input[y][x][1] = img.getGreen(pixel) / 255.0;
        input[y][x][2] = img.getBlue(pixel) / 255.0;
      }
    }
    return input;
  }

  @override
  void onClose() {
    _interpreter.close();
    super.onClose();
  }
}
