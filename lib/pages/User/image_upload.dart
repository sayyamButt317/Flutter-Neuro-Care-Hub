import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neuro_care_hub_app/controllers/brain_tumor_controller.dart';
import 'package:neuro_care_hub_app/controllers/image_controllers.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

class ImageUploadPage extends GetView<TumorController> {
  ImageUploadPage({super.key});


  // final BrainTumorImageDetector imagecontroller =
  //     Get.put<BrainTumorImageDetector>(BrainTumorImageDetector());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc2aed3),
      body: Column(
        children: [
          SizedBox(
            height: 10.0.hp,
          ),
          // Image display
          SizedBox(
            height: Get.height * 0.2,
            child: Obx(() {
              return Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    controller.getImage(ImageSource.gallery);
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 5,
                      ),
                      shape: BoxShape.rectangle,
                      color: Colors.grey,
                      image: controller.selectedImage == null
                          ? controller.myuser.value.image != null &&
                                  controller.myuser.value.image!.isNotEmpty
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      controller.myuser.value.image!),
                                )
                              : null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(controller.selectedImage!),
                            ),
                    ),
                    child: controller.selectedImage == null
                        ? controller.myuser.value.image != null &&
                                controller.myuser.value.image!.isNotEmpty
                            ? Container()
                            : const Center(
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              )
                        : null,
                  ),
                ),
              );
            }),
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          // Predict button for brain tumor
          // ReusableButton(
          //   onTap: () async {
          //     if (controller.selectedImage != null) {
          //       controller.isProfileLoading(true);
          //       // Map<String, dynamic> result = await imagecontroller
          //       //     .predict(controller.selectedImage!.path);

          //       showDialog(
          //         context: context,
          //         builder: (context) => AlertDialog(
          //           title: const Text('Brain Tumor Prediction'),
          //           content: Text(result as String),
          //           actions: [
          //             TextButton(
          //               onPressed: () => Navigator.of(context).pop(),
          //               child: const Text('OK'),
          //             ),
          //           ],
          //         ),
          //       );

          //       controller.isProfileLoading(false);
          //     } else {
          //       // Handle case where no image is selected
          //       showDialog(
          //         context: context,
          //         builder: (context) => AlertDialog(
          //           title: const Text('No Image Selected'),
          //           content: const Text('Please select an image first.'),
          //           actions: [
          //             TextButton(
          //               onPressed: () => Navigator.of(context).pop(),
          //               child: const Text('OK'),
          //             ),
          //           ],
          //         ),
          //       );
          //     }
          //   },
          //   text: 'predict',
        
          // ),
        ],
      ),
    );
  }
}
