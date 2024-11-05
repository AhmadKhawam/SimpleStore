import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:task6/view/cart/controller/cart_controller.dart';
import 'package:task6/view/cart/widget/cart_app_header.dart';
import 'package:task6/view/cart/widget/container_for_price.dart';
import 'package:task6/view/cart/widget/item_card_list_tile.dart';
import 'package:task6/view/cart/widget/item_count.dart';
import 'package:task6/view/widget/custom_text.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

   CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9),
      body: GetBuilder<CartController>(builder: (controller) {
        return SingleChildScrollView( // إضافة التمرير هنا
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CartAppHeader(),
              ItemCount(totalItem: controller.getTotalItems()),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 472.7.h, // ارتفاع ثابت لقائمة العناصر مع التمرير داخلها
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final product = controller.cartItems[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Slidable(
                          key: ValueKey(index),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.20,
                            children: [
                              Container(
                                width: 58.w,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: SingleChildScrollView( // إضافة التمرير هنا
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min, // تعيين الحجم ليكون الحد الأدنى
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          controller.updateOrder(product, 1);
                                        },
                                        icon: const Icon(Icons.add, color: Colors.white),
                                      ),
                                      CustomText(
                                        text: " ${product.quantity}",
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        alignment: Alignment.center,
                                        height: 0.35,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.updateOrder(product, -1);
                                        },
                                        icon: const Icon(Icons.remove, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),

                              ),
                            ],
                          ),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.2,
                            children: [
                              SizedBox(width: 9.w),
                              Container(
                                width: 58.w,
                                height: 104.h,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    controller.deleteOrder(product.id);
                                  },
                                  icon: Image.asset(
                                    'assets/images/Iconr.png',
                                    height: 20,
                                    width: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          child: ItemCardListTile(
                            name: product.peoduct.name,
                            price: product.peoduct.price,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              ContainerForPrice(
                subTotal: "\$ ${controller.subTotall()}",
                delivery: "\$ ${controller.delivery()}",
                total: "\$ ${controller.TotalCoast()}",
              ),
            ],
          ),
        );
      }),
    );
  }
}
