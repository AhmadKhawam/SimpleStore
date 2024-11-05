import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task6/view/widget/custom_text.dart';


class ProductFavCard extends StatelessWidget {
  const ProductFavCard(
      {super.key,
      required this.text,
      required this.price,
      required this.onFavoriteToggle});
  final String text;
  final int price;
  final bool isFavorite = true;
  final VoidCallback onFavoriteToggle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.w,
      height: 217.h,
      // margin:  EdgeInsets.symmetric(horizontal: 8.0.h),
      //  margin: EdgeInsets.only(right: 20.w,left: 20.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              right: 8,
            ),
            child: Row(
            //  mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color(0xffF7F7F9),
                    ),
                    height: 28.h,
                    width: 28.w,
                    child: Image.asset(
                      'assets/images/Vector (6).png',
                      height: 16.h,
                      width: 16.w,
                    ),
                  ),
                  onPressed: onFavoriteToggle,
                ),
                Image.asset(
                  'assets/images/image 1.png',
                  height: 95.h,
                  width: 95.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomText(
              text: 'Best Seller',
              fontSize: 12.sp,
              color: Colors.green,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomText(
              text: text,
              fontSize: 11.sp,
              color: const Color(0xff6A6A6A),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: '$price',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
                Image.asset('assets/images/Group 163.png',height: 16,width: 42,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
