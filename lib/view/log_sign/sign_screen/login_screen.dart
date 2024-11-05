import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/view/home/screen/home_screen.dart';
import '../../../core/const_data/app_image.dart';
import '../auth_controller/auth_controller.dart';
import 'rigster_screen.dart';

class LoginPage extends StatelessWidget {
  final AuthController controller = Get.find<AuthController>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // تحديد عرض الشاشة

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hello Again!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(labelText: 'Email Address'),
                  ),
                  Obx(() => TextField(
                    controller: controller.passwordController,
                    obscureText: !controller.isPasswordVisible.value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          controller.togglePasswordVisibility();
                        },
                      ),
                    ),
                  )),
                  const SizedBox(height: 8),
                  // زر Recovery Password في الجهة اليمنى
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {}, // Forgot password logic
                      child: const Text('Recovery Password'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: screenWidth, // الزر يأخذ كامل عرض الشاشة
                    child: ElevatedButton(
                      onPressed: () async {
                        bool isLoggedIn = await controller.login(); // تأكد من استدعاء login كدالة
                        if (isLoggedIn) {
                          Get.to(() =>   HomeScreen()); // الانتقال إلى الصفحة الرئيسية باستخدام Get.to()
                        } else {
                          // إظهار رسالة خطأ في حال فشل تسجيل الدخول
                          Get.snackbar('Error', 'Login failed. Please try again.');
                        }
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        backgroundColor: AppColor.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Center(
                        child: Text('Sign In'),
                      ),
                    ),


                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: screenWidth, // الزر يأخذ كامل عرض الشاشة
                    child: TextButton(
                      onPressed: () {
                        // Google sign-in logic
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        backgroundColor: AppColor.lightSilver,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى
                        children: [
                          Image.asset(
                            AppImage.google,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          const Center(
                            child: Text(
                              'Sign In with Google',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // زر Create Account في أسفل الشاشة
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Get.to(RegisterPage());
                },
                child: const Text('New User? Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
