import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task6/view/widget/custom_text.dart';


class CartAppHeader extends StatelessWidget {
  const CartAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.0.w),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                'assets/images/Icon24.png',
                width: 44.w,
                height: 44.h,
              )),
          SizedBox(
            width: 85.w,
          ),
          const CustomText(
            text: 'My Cart',
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
