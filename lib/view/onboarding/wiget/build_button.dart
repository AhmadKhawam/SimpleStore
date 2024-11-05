import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../onboarding_controller.dart';

class BuildButton extends StatelessWidget {
  final OnboardingController controller;

  const BuildButton({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String buttonText = controller.currentPage.value == 0
          ? 'Get Started'
          : controller.currentPage.value == 1
          ? 'Next'
          : 'Finish';

      return ElevatedButton(
        onPressed: () {
          if (controller.currentPage.value == 2) {
            Get.toNamed('/registerPage');
          } else {
            controller.nextPage();
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        child: Text(buttonText),
      );
    });
  }
}
