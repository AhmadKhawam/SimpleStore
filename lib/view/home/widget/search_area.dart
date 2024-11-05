import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task6/view/bottom_navigation_bar/screen/bottom_navigation_bar.dart';

import 'package:task6/view/search/search_screen.dart'; // تأكد من استيراد صفحة البحث

class SearchArea extends StatelessWidget {
  const SearchArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 21.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Looking for...',
                  hintStyle: TextStyle(fontSize: 12.sp),
                  prefixIcon: Image.asset('assets/images/Vector.png'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                onTap: () => Get.to(SearchPage()), // التنقل لصفحة البحث عند الضغط
              ),
            ),
          ),
          SizedBox(width: 8.w),
          InkWell(
            child: Container(
              height: 52.h,
              width: 52.w,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.tune, color: Colors.white),
            ),
            onTap: () => Get.to( BottomNavBar()),
          ),
        ],
      ),
    );
  }
}
