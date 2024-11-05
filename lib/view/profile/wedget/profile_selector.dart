import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../profile_controller.dart';

class ProfileImageSelector extends StatelessWidget {
  final ProfileController profileController;

  const ProfileImageSelector({Key? key, required this.profileController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            color: Colors.white,
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('Take a Picture'),
                  onTap: () {
                    profileController.pickImage(ImageSource.camera);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_album),
                  title: const Text('Choose from Gallery'),
                  onTap: () {
                    profileController.pickImage(ImageSource.gallery);
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Obx(() {
            return CircleAvatar(
              radius: 50,
              backgroundImage: profileController.selectedImagePath.value.isNotEmpty
                  ? FileImage(File(profileController.selectedImagePath.value))
                  : AssetImage(profileController.user.value.profileImage) as ImageProvider,
            );
          }),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
