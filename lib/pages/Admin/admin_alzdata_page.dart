import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/controllers/alzheimer_controller.dart';

class AdminAlzDataScreen extends StatefulWidget {
  const AdminAlzDataScreen({super.key});

  @override
  State<AdminAlzDataScreen> createState() => _AdminAlzDataScreenState();
}

class _AdminAlzDataScreenState extends State<AdminAlzDataScreen> {
  final AlzheimerController getxcontroller = Get.put(AlzheimerController());

  @override
  void initState() {
    super.initState();
    getxcontroller.getAlzInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Alzheimer Record'),
      ),
      body: Obx(
        () {
          if (getxcontroller.isProfileLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: getxcontroller.allUsers.length,
            itemBuilder: (context, index) {
              final user = getxcontroller.allUsers[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text('User Name :${user.name ?? ''} ${user.lastname ?? ''}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disease: ${user.disease ?? ''}'),
                        Text('Address: ${user.address ?? ''}'),
                        Text('City: ${user.city ?? ''}'),
                        Text('State: ${user.state ?? ''}'),
                        // Text('Gender: ${user.gender ?? ''}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
