import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task6/view/widget/custom_text.dart';

class ContainerForPrice extends StatelessWidget {
  const ContainerForPrice({
    super.key,
    required this.subTotal,
    required this.delivery,
    required this.total,
  });
  final String subTotal;
  final String delivery;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 375.w,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView( // إضافة التمرير هنا
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'Subtotal',
                    color: Color(0xff707B81),
                  ),
                  CustomText(
                    text: subTotal,
                    fontFamily: "Poppins",
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'Delivery',
                    color: Color(0xff707B81),
                  ),
                  CustomText(
                    text: delivery,
                    fontFamily: "Poppins",
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Image.asset('assets/images/Vector 1785.png'),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'Total Cost',
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: total,
                    fontFamily: "Poppins",
                    color: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  // تنفيذ العملية عند الضغط على الزر
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(335.w, 50.h),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: const CustomText(
                  alignment: Alignment.center,
                  text: 'Checkout',
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
