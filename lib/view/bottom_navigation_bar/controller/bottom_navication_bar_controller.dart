import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/view/favourite/screen/favourite_screen.dart';
import 'package:task6/view/home/screen/home_screen.dart';
import 'package:task6/view/notifications/screen/notifications_screen.dart';
import 'package:task6/view/profile/profile_screen.dart';

class BottomNavBarController extends GetxController {
  int currentPage = 0;

  final List<Widget> screens = [
     HomeScreen(),
     FavouriteScreen(),
    const NotificationsScreen(),
    ProfileView(),

  ];

  changePage(int i) {
    currentPage = i;
    update();
  }
}
