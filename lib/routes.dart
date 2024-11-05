import 'package:get/get.dart';
import 'package:task6/view/bottom_navigation_bar/screen/bottom_navigation_bar.dart';
import 'package:task6/view/cart/screen/cart_screen.dart';
import 'package:task6/view/details/screen/details_screen.dart';
import 'package:task6/view/favourite/screen/favourite_screen.dart';
import 'package:task6/view/home/screen/home_screen.dart';

import 'package:task6/view/log_sign/sign_screen/rigster_screen.dart';

import 'package:task6/view/onboarding/onboarding_screen.dart';
import 'package:task6/view/profile/profile_screen.dart';
import 'package:task6/view/search/search_screen.dart';

import 'view/menu/menu_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => OnboardingView()),
  GetPage(name: '/registerPage', page: () => RegisterPage()),
  GetPage(name: '/homeScreen', page: () =>   HomeScreen()),
  GetPage(name: '/menuView', page: () => MenuView()),
  GetPage(name: '/profileView', page: () => ProfileView()),
  GetPage(name: '/searchPage', page: () => SearchPage()),
  GetPage(name: '/detailsScreen', page: () =>  const DetailsScreen()),
  GetPage(name: '/favouriteScreen', page: () =>   FavouriteScreen()),
  GetPage(name: '/cartScreen', page: () =>   CartScreen()),
  GetPage(name: '/bottomNvBarScreen', page: () =>   BottomNavBar()),
];
