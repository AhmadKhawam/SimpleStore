import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task6/view/details/controller/detail_controller.dart';
import 'package:task6/view/details/widget/add_to_fav.dart';
import 'package:task6/view/details/widget/product_details.dart';
import 'package:task6/view/widget/app_header2.dart';
import 'package:task6/view/widget/custom_text.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailController());
    return Scaffold(
        backgroundColor: const Color(0xFFF7F7F9),
        body: GetBuilder<DetailController>(
            init: DetailController(),
            builder: (controller) {
              return Container(
                padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppHeader2(
                        goToCartScreen: controller.goToCartPage,
                        text: 'T-shirt Shop',
                        imageIcon: Image.asset(
                          'assets/images/Icon22.png',
                          width: 44.w,
                          height: 44.h,
                        )),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomText(
                        text: controller.product.name,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                      text: controller.product.subCategory.category.name,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: ProductDetails(
                            price: '${controller.product.price}')),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 67.h,
                      width: 334.w,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 14),
                            height: 56.h,
                            width: 56.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Image.asset(
                              'assets/images/image 5.png',
                              width: 40.w,
                              height: 40.h,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    const CustomText(
                      text:
                          'Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there .',
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: 'Read More',
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 48,
                      ),
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AddToFav(
                              isFavorite: controller.hController
                                  .isFavorite(controller.product),
                              onFavoriteToggle: () {
                                controller.toggleFavorite(controller.product);
                              }),
                          SizedBox(
                            width: 40.w,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              controller.addToCart();
                              // تنفيذ العملية عند الضغط على الزر
                            },
                            icon: const Icon(Icons.shopping_bag, color: Colors.white),
                            label: const Text(
                              'Add To Cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(190.w, 50.h),

                              backgroundColor: Colors.green,
                              //  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    
                  ],
                ),
              );
            }));
  }
}
