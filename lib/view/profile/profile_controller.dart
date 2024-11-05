import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// يجب استيراد هذه المكتبة لاستخدام File
import 'package:task6/view/menu/menu_controller.dart';

class UserModel {
  String name;
  String email;
  String profileImage;
  String password;

  UserModel({
    required this.name,
    required this.email,
    required this.profileImage,
    required this.password,
  });
}

class ProfileController extends GetxController {
  final MenController menuController = Get.find();

  var user = UserModel(
    name: 'Programmer X',
    email: 'programmerx@gmail.com',
    profileImage: 'assets/images/profile.jpg',
    password: '********',
  ).obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var selectedImagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // تعيين قيم الحقول من نموذج المستخدم
    nameController.text = user.value.name;
    emailController.text = user.value.email;
    passwordController.text = user.value.password;
  }

  @override
  void onClose() {
    // تخلص من عناصر التحكم في النص عند إغلاق وحدة التحكم
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // تحديث بيانات المستخدم
  void updateProfile() {
    user.update((val) {
      if (val != null) {
        val.name = nameController.text;
        val.email = emailController.text;
        val.password = passwordController.text;

        // تحديث صورة الملف الشخصي إذا تم اختيار صورة جديدة
        if (selectedImagePath.value.isNotEmpty) {
          val.profileImage = selectedImagePath.value;
        } else {
          // صورة افتراضية في حالة عدم اختيار صورة جديدة
          val.profileImage = 'assets/images/profile.jpg';
        }
      }
    });

    // تحديث بيانات المستخدم في وحدة التحكم الخاصة بالقائمة
    menuController.updateUser(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      profileImage: user.value.profileImage, // تحديث الصورة
    );

    // إظهار رسالة تأكيد
    Get.snackbar(
      'Profile Updated',
      'Your profile has been updated successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  // دالة لاختيار الصورة من الكاميرا أو المعرض
  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    // تحقق مما إذا كانت الصورة قد تم اختيارها
    if (pickedFile != null) {
      updateProfileImage(pickedFile.path); // استخدام الدالة لتحديث الصورة
    } else {
      Get.snackbar(
        'Error',
        'No image selected.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // دالة لتحديث صورة الملف الشخصي
  void updateProfileImage(String newImagePath) {
    selectedImagePath.value = newImagePath; // تحديث مسار الصورة الجديدة
    user.value.profileImage = newImagePath; // تحديث مسار الصورة الجديدة في نموذج المستخدم
  }
}
