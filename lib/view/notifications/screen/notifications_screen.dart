import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task6/view/bottom_navigation_bar/controller/bottom_navication_bar_controller.dart';
import 'package:task6/view/widget/custom_text.dart';


class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        final controller = Get.find<BottomNavBarController>();
                        controller.changePage(0);
                        Get.offNamed('/bottomNvBarScreen');
                      },
                      child: Image.asset(
                        'assets/images/Icon24.png',
                        width: 44.w,
                        height: 44.h,
                      )),
                  const CustomText(
                    text: "Notifications",
                    fontWeight: FontWeight.w600,
                  ),
                  Image.asset(
                    'assets/images/Icon23.png',
                    width: 44.w,
                    height: 44.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
