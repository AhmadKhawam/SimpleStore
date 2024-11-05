import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task6/view/widget/custom_text.dart';


class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.isFavorite,
      required this.onFavoriteToggle,
      required this.name, required this.price, required this.addToCart});
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final String name;
  final int price;
    final VoidCallback addToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157.w,
      height: 199.h,
      // margin:  EdgeInsets.symmetric(horizontal: 8.0.h),
      margin: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              right: 8,
            ),
            
            child: Row(
            //  mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                IconButton(
                  
                  icon: isFavorite? Image.asset('assets/images/Vector (6).png',height: 14.31.h,width: 14.31.w,) : Image.asset('assets/images/Vector (4).png'),
                  // Icon(
                  //   isFavorite ? Icons.heart_broken : Icons.favorite_border,
                  //   color: isFavorite ? Colors.red : Colors.grey,
                  // ),
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
            height: 10.h,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: CustomText(
              text: 'Best Seller',
              fontSize: 12,
              color: Colors.green,
              fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: CustomText(
              text: name,
              fontSize: 14,
              color: const Color(0xff6A6A6A),
              fontWeight: FontWeight.w600,
            ),
          ),
          // SizedBox(
          //   height: 5.h,
          // ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: '$price',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
                Container(
                  width: 34.w, // يمكنك ضبط العرض حسب الحاجة
                  height: 37.h, // يمكنك ضبط الارتفاع حسب الحاجة
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16.r),
                          topLeft: Radius.circular(16.r))),
                  child: IconButton(
                    onPressed: addToCart,
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                    
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
