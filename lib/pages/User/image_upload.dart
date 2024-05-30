import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neuro_care_hub_app/controllers/brain_tumor_controller.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

class ImageUploadPage extends GetView<TumorController> {
  ImageUploadPage({super.key});

  final TumorController getxcontroller =
      Get.put<TumorController>(TumorController());

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
                    getxcontroller.getImage(ImageSource.gallery);
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
                      image: getxcontroller.selectedImage == null
                          ? getxcontroller.myuser.value.image != null &&
                                  getxcontroller.myuser.value.image!.isNotEmpty
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      getxcontroller.myuser.value.image!),
                                )
                              : null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(getxcontroller.selectedImage!),
                            ),
                    ),
                    child: getxcontroller.selectedImage == null
                        ? getxcontroller.myuser.value.image != null &&
                                getxcontroller.myuser.value.image!.isNotEmpty
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
          ReusableButton(
            onTap: () async {
              getxcontroller.isProfileLoading(true);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Brain Tumor Prediction'),
                  // content: Text(result),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
              getxcontroller.isProfileLoading(false);
            },
            width: MediaQuery.of(context).size.width * 0.2,
            text: "Predict ",
            color: const Color(0xff664f9e),
          ),
        ],
      ),
    );
  }
}
