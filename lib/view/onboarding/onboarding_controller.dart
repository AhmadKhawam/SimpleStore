import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController();

  // الانتقال إلى الصفحة التالية
  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // الانتقال إلى الصفحة النهائية
      finishOnboarding();
    }
  }

  // معالجة تغيير الصفحة
  void onPageChanged(int index) {
    currentPage.value = index;
  }

  // معالجة النهاية أو الانتقال النهائي
  void finishOnboarding() {
    print("Onboarding Completed!");
    Get.offAllNamed(
        '/registerPage'); // الانتقال إلى صفحة التسجيل باستخدام المسار
  }

  // التخلص من الموارد عند عدم الحاجة لها
  @override
  void onClose() {
    pageController.dispose(); // التخلص من الـ PageController
    super.onClose();
  }
}
