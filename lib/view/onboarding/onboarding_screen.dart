import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/view/onboarding/wiget/build_button.dart';
import 'package:task6/view/onboarding/wiget/build_page.dart';
import 'package:task6/view/onboarding/wiget/build_page_image.dart';
import 'package:task6/view/onboarding/wiget/build_page_indeicator.dart';

import 'onboarding_controller.dart';


class OnboardingView extends StatelessWidget {
  final OnboardingController controller = Get.find<OnboardingController>();

  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(  // Add a SingleChildScrollView to prevent overflow
            child: Column(
              children: [
                const SizedBox(height: 70),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,  // Dynamically set the height
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    children: const [
                      BuildPage(
                        title: 'WELCOME TO PROGRAMMER STORE',
                        subtitle: '',
                      ),
                      BuildPage(
                        title: "Let's Start Journey",
                        subtitle: 'Smart, Simple, & Impressive Collection. Explore Now.',
                      ),
                      BuildPage(
                        title: 'You Have The Power To',
                        subtitle: 'There Are Many Beautiful and Attractive Stores for You.',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                BuildPageIndicator(controller: controller),
                const SizedBox(height: 80),
                BuildButton(controller: controller),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Obx(() => BuildPageImages(currentPage: controller.currentPage.value)),  // Wrap the BuildPageImages with Obx
        ],
      ),
    );
  }
}
