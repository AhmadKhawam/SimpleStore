import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../onboarding_controller.dart';

class BuildPageIndicator extends StatelessWidget {
  final OnboardingController controller;

  const BuildPageIndicator({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Obx(() => Container(
          margin: const EdgeInsets.all(4),
          width: controller.currentPage.value == index ? 24 : 16,
          height: 4,
          decoration: BoxDecoration(
            color: controller.currentPage.value == index ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
        ));
      }),
    );
  }
}
