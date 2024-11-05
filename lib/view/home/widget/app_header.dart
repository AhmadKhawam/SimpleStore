import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task6/view/menu/menu_screen.dart';
import 'package:task6/view/widget/custom_text.dart';


class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.goToCart});
  final VoidCallback goToCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h, bottom: 19.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Get.to(MenuView()), // التنقل إلى صفحة القائمة عند الضغط
            icon: Image.asset('assets/images/Hamburger (1).png'),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: 160.w,
            child: Stack(
              children: [
                Stack(children: [
                  SizedBox(
                    width: 250.w,
                    height: 50.h,
                  ),
                  const Positioned(
                    top: 5,
                    right: 0,
                    child: CustomText(
                      text: 'Explore',
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                  ),
                ]),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/Highlight_05 (1).png',
                    height: 19.h,
                    width: 18.w,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: goToCart,
            child: Image.asset(
              'assets/images/Icon22.png',
              width: 44.w,
              height: 44.h,
            ),
          ),
        ],
      ),
    );
  }
}
