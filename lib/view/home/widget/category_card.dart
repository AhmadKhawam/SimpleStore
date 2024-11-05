import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task6/view/widget/custom_text.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108.w,
      margin: EdgeInsets.symmetric(horizontal: 8.0.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
    //  alignment: Alignment.center,
      child: CustomText(text: text,fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w400,alignment: Alignment.center,)
    );
  }
}
