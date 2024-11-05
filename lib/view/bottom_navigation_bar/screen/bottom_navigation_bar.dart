import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/bottom_navication_bar_controller.dart';

class BottomNavBar extends StatelessWidget {
    final BottomNavBarController bottomNavBarController = Get.put(BottomNavBarController());

   BottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
        builder: (controller) => Scaffold(
            //  body: controller.screens.elementAt(controller.currentPage),
             body: controller.screens[controller.currentPage],
              bottomNavigationBar: Stack(
              
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 99.h, 
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/Vector 1789.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: BottomAppBar(
                      height: 50,
                      color: Colors.transparent,
                      shape: const CircularNotchedRectangle(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () => controller.changePage(0),
                                child: Image.asset(
                                  'assets/images/home-2.png',
                                  color: controller.currentPage == 0
                                      ? Colors.green
                                      : Colors.black,
                                )),
                            GestureDetector(
                                onTap: () => controller.changePage(1),
                              child: Image.asset('assets/images/heart.png',color: controller.currentPage == 1
                                      ? Colors.green
                                      : Colors.black,)),
                            SizedBox(width: 40.w), 
                            GestureDetector(
                              onTap: () => controller.changePage(2),
                              child: Image.asset('assets/images/Icon.png',color: controller.currentPage == 2
                                      ? Colors.green
                                      : Colors.black,)),
                            GestureDetector(
                              onTap: () => controller.changePage(3),
                              child: Image.asset('assets/images/frame.png',color: controller.currentPage == 3
                                      ? Colors.green
                                      : Colors.black,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40.h,
                    child: FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () {},
                      shape: const CircleBorder(),
                      child: Image.asset('assets/images/bag-2.png'),
                    ),
                  ),
                ],
              ),
          
            ));
  }
}
