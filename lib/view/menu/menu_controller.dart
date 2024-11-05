// لتحويل البيانات إلى JSON
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task6/core/service/link.dart';
import 'package:task6/view/onboarding/onboarding_screen.dart';

// نموذج بيانات المستخدم
class UserModel {
  String name;
  String profileImage;

  UserModel({required this.name, required this.profileImage});
}

// التحكم في بيانات المستخدم
class MenController extends GetxController {
  var user = UserModel(
    name: "Programmer X",
    profileImage: "assets/images/profile.jpg",
  ).obs;

  // تحديث بيانات المستخدم
  void updateUser({required String name, required String profileImage, required String email, required String password}) {
    user.update((user) {
      user?.name = name; // تحديث الاسم
      user?.profileImage = profileImage; // تحديث الصورة
    });
  }

  // دالة لتسجيل الخروج من الـ API
  Future<void> logout() async {
    try {
      final response = await http.post(
        Uri.parse(AppLink.logout),
        headers: {
          'Content-Type': 'application/json',
          // يمكنك إضافة ترويسات إضافية إذا لزم الأمر، مثل التوكن
        },
      );

      if (response.statusCode == 200) {
        print("Logout successful");
               Get.to(() =>  OnboardingView());
      } else {
        print("Failed to logout: ${response.statusCode}");
        Get.snackbar(
          "Logout Failed",
          "Unable to logout. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Error during logout: $e");
      Get.snackbar(
        "Error",
        "An error occurred while trying to logout. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
// دالة لتحديث صورة الملف الشخصي
  void updateProfileImage(String newImagePath) {

    user.value.profileImage = newImagePath; // تحديث مسار الصورة الجديدة في نموذج المستخدم
  }
}
