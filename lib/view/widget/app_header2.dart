import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task6/view/bottom_navigation_bar/controller/bottom_navication_bar_controller.dart';
import 'package:task6/view/widget/custom_text.dart';


class AppHeader2 extends StatelessWidget {
  const AppHeader2(
      {super.key,
      required this.text,
      required this.imageIcon,
      required this.goToCartScreen});
  final String text;
  final dynamic imageIcon;
  final VoidCallback goToCartScreen;
  @override
  Widget build(BuildContext context) {
    return Row(
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
        CustomText(
          text: text,
          fontWeight: FontWeight.w600,
        ),
        GestureDetector(
          onTap: goToCartScreen,
          // Get.toNamed('/cartScreen');

          child: imageIcon,
        ),
      ],
    );
  }
}
