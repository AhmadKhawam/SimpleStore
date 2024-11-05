
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task6/view/home/controller/home_controller.dart';
import 'package:task6/view/home/widget/app_header.dart';
import 'package:task6/view/home/widget/category_card.dart';
import 'package:task6/view/home/widget/image.dart';
import 'package:task6/view/home/widget/product_card.dart';
import 'package:task6/view/home/widget/search_area.dart';
import 'package:task6/view/widget/custom_text.dart';


class HomeScreen extends StatelessWidget {
  final HomeController cartController = Get.put(HomeController());

   HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF7F7F9),
        body: GetBuilder<HomeController>(
            builder: (controller) {
              if (controller.categoryResponse.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    AppHeader(goToCart : controller.goToCartPage),
                    const SearchArea(),
                    Padding(
                      padding: EdgeInsets.only(left: 21.0.w),
                      child: const CustomText(
                        text: 'Select Category',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 16.h),
                      child: SizedBox(
                        height: 40.h,
                        child: ListView.builder(
                          itemCount: controller.categoryResponse.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final category = controller.categoryResponse[index];
                            return CategoryCard(
                              text: category.name,
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 5.h, top: 19.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: 'Popular T-shirt',
                            fontWeight: FontWeight.w500,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const CustomText(
                                text: 'See all',
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                              )),
                        ],
                      ),
                    ),
                  
                    Container(
                      alignment: Alignment.center,
                      height: 199.h,
                      width: 334.w,
                      child: ListView.builder(
                        itemCount:
                            controller.productResponse.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final product =
                              controller.productResponse[index];
                          return GestureDetector(
                            onTap: () {
                              controller.goToPageProductDetails(product);
                            },
                            child: ProductCard(
                              isFavorite: controller.isFavorite(product),
                              onFavoriteToggle: () {
                                controller.toggleFavorite(product);
                              },
                              name: product.name,
                              price: product.price,
                              addToCart: () {
                                controller.addToCart(product);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const customImage(),
                    //  const SizedBox(height: 2),
                  ],
                ),
              );
            }));
  }
}
