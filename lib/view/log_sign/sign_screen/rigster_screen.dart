import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/view/home/screen/home_screen.dart';
import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../auth_controller/auth_controller.dart';
import 'login_screen.dart';

class RegisterPage extends StatelessWidget {
  final AuthController controller = Get.find<AuthController>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView( // إضافة SingleChildScrollView هنا
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1, // ترك مساحة في الأعلى
              ),
              const Text(
                'Register Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: 'Your Name'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.emailController,
                decoration: const InputDecoration(labelText: 'Email Address'),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              SizedBox(
                width: screenWidth,
                child: ElevatedButton(
                  onPressed: () async {
                    // استدعاء دالة التسجيل
                    await controller.register();

                    // تحقق من نجاح التسجيل بناءً على حالة معينة
                    if (controller.userModel.value.email != null) {
                      // إذا كان التسجيل ناجحًا، الانتقال إلى HomeScreen
                      Get.to(() =>   HomeScreen());
                    } else {
                      // في حالة الفشل، يمكنك إضافة معالجة هنا إذا رغبت
                      Get.snackbar("Error", "Registration failed. Please try again.");
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
                    child: Text('Sign Up'),
                  ),
                ),

              ),
              const SizedBox(height: 16),
              SizedBox(
                width: screenWidth,
                child: TextButton(
                  onPressed: () {
                    // Google sign-up logic
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    backgroundColor: AppColor.lightSilver,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImage.google,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      const Center(
                        child: Text(
                          'Sign up with Google',
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
              const SizedBox(height: 200), // ترك مساحة إضافية بين العناصر
              // زر الانتقال إلى صفحة تسجيل الدخول
              TextButton(
                onPressed: () {
                  Get.to(LoginPage());
                },
                child: const Text('Already Have Account? Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
