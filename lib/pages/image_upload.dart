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

          // image
          SizedBox(
            height: Get.height * 0.2,
            child: Obx(() {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        getxcontroller.getImage(ImageSource.gallery);
                      },
                      child: getxcontroller.selectedImage == null
                          ? (getxcontroller.myuser.value.image != null &&
                          getxcontroller.myuser.value.image!.isNotEmpty)
                          ? Container(
                        width: 200,
                        height: 150,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 5,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                getxcontroller.myuser.value.image!),
                          ),
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      )
                          : Container(
                        width: 120,
                        height: 120,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      )
                          : Container(
                        width: 120,
                        height: 120,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            FileImage(getxcontroller.selectedImage!),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
          ),


          SizedBox(
            height: 2.0.hp,
          ),
          // select button


          ReusableButton(
            onTap: () async {
              getxcontroller.isprofileloading(true);
              await getxcontroller.storeUserInfo();
              getxcontroller.isprofileloading(false);
            },
            width: MediaQuery.of(context).size.width * 0.2,
            text: "Detect",
            color: const Color(0xff664f9e),
          ),

        ],

      ),

    );
  }
}
