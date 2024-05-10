import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/brain_tumor_controller.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TumorController tumorController = Get.put(TumorController());

  @override
  void initState() {
    // Fetch user info when the screen loads
    tumorController.getuserinfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Screen'),
      ),
      body: Obx(() {
        // Check if user data is loading
        if (tumorController.isprofileloading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Check if user data is available
        if (tumorController.myuser.value.name != null) {
          return ListView.builder(
            itemCount: 1, // Assuming you only want to display one user's data
            itemBuilder: (context, index) {
              final user = tumorController.myuser.value;
              return ListTile(
                title: Text(user.name ?? ''),
              );
            },
          );
        } else {
          return const Center(child: Text('No user data found'));
        }
      }),
    );
  }
}
