import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task6/view/widget/custom_text.dart';


class customImage extends StatelessWidget {
  const customImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, bottom: 5.h, top: 16.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: 'New Arrivals',
                      fontWeight: FontWeight.w500,
                    ),
                    TextButton(
                        onPressed: () {
                          // Action for "See all" button
                        },
                        child: const CustomText(
                          text: 'See all',
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        )),
                  ]),
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.asset(
                  'assets/images/Rectangle 4231.png',
                  height: 95.h,
                ),
                Positioned(
                    left: 22,
                  child: Image.asset('assets/images/Frame 293.png',width: 131,height: 55,),
                
                ),
              ],
            )
          ],
        ),
        Positioned(
            right: 50,
            bottom: -5,
            child: Image.asset('assets/images/image 4.png')),
        Positioned(
            right: 159,
            bottom: 55,
          child: Image.asset(
            'assets/images/Misc_06 (1).png',
            height: 26.h,
            width: 26.w,
          ),
        
        ),
        Positioned(
          left: 42,
          bottom: 16,
          child: Image.asset('assets/images/Vector (7).png',width: 15.48.w,height: 16.73,))
      ],
    );
  }
}
