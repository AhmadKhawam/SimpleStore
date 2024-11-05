import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/view/profile/wedget/profile_selector.dart';
import 'package:task6/view/profile/wedget/profile_text_filed.dart';
import 'package:task6/view/profile/wedget/save_butten.dart';

import 'profile_controller.dart';

class ProfileView extends StatelessWidget {
  final ProfileController profileController = Get.find<ProfileController>();
  final _formKey = GlobalKey<FormState>();

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // تأكد من أن `ProfileImageSelector` يستخدم `Obx` داخله إذا كان هناك متغيرات ملاحظة
                ProfileImageSelector(profileController: profileController),
                const SizedBox(height: 24),
                ProfileTextField(
                  controller: profileController.nameController,
                  labelText: 'Your Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ProfileTextField(
                  controller: profileController.emailController,
                  labelText: 'Email Address',
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ProfileTextField(
                  controller: profileController.passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => Get.toNamed('/change-password'),
                    child: const Text(
                      'Recovery Password',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ProfileSaveButton(
                  profileController: profileController,
                  formKey: _formKey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
