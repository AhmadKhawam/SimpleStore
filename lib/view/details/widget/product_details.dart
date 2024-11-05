import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task6/view/widget/custom_text.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: 240,
              width: 352,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/images/image 5.png',
                    width: 220,
                    height: 217,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/Ellipse 5.png',
                      width: 352.w,
                      height: 68.h,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          child: CustomText(
            text: price,
            //'${controller.product.price}',
            fontSize: 22,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
