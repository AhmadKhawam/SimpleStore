import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task6/view/favourite/widget/product_fav_card.dart';
import 'package:task6/view/home/controller/home_controller.dart';
import 'package:task6/view/widget/app_header2.dart';


class FavouriteScreen extends StatelessWidget {
  final HomeController controller = Get.find();

   FavouriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.0.w),
                child: AppHeader2(
                  goToCartScreen: (){},
                    text: 'Favourite',
                    imageIcon: Image.asset(
                      'assets/images/Iconh.png',
                      width: 44.w,
                      height: 44.h,
                    ))),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.0.w),
                child: GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (controller) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 14.w,
                          mainAxisSpacing: 12.h,
                          childAspectRatio: 159.w / 217.h,
                        ),
                        itemCount: controller.favoriteItems.length,
                        itemBuilder: (context, index) {
                          final product = controller.favoriteItems[index];
                          return ProductFavCard(
                            text: product.name,
                            price: product.price,
                            onFavoriteToggle: () {
                                    controller.toggleFavorite(product);
                                  },
                          );
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
