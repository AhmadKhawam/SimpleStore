import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // يجب استيراد هذه المكتبة لاستخدام File
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/view/cart/screen/cart_screen.dart';

import 'package:task6/view/favourite/screen/favourite_screen.dart';
import 'package:task6/view/notifications/screen/notifications_screen.dart';
import 'package:task6/view/profile/profile_screen.dart';
import '../profile/profile_controller.dart';
import 'menu_controller.dart';

class MenuView extends StatelessWidget {
  MenuView({super.key});
  final ProfileController controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    final MenController menController = Get.find<MenController>();

    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(menController),
          _buildDrawerItem(
            icon: Icons.person,
            title: 'Profile',
            onTap: () => Get.to(ProfileView()),
          ),
          _buildDrawerItem(
            icon: Icons.shopping_cart,
            title: 'My Cart',
            onTap: () => Get.to(  CartScreen()),
          ),
          _buildDrawerItem(
            icon: Icons.favorite,
            title: 'Favorites',
            onTap: () => Get.to(  FavouriteScreen()),
          ),
          _buildDrawerItem(
            icon: Icons.list_alt,
            title: 'Orders',
            onTap: () => Get.to(  CartScreen()),
          ),
          _buildDrawerItem(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () => Get.to(const NotificationsScreen()),
          ),
          _buildDrawerItem(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () => Get.to(ProfileView()),
          ),
          const Divider(color: Colors.white),
          _buildDrawerItem(
            icon: Icons.exit_to_app,
            title: 'Logout',
            onTap: menController.logout,
          ),
        ],
      ),
    );
  }


  // بناء الهيدر للقائمة الجانبية
  Widget _buildHeader(MenController menuController) {
    return Obx(
          () => UserAccountsDrawerHeader(
        accountName: Text(
          menuController.user.value.name.isNotEmpty
              ? menuController.user.value.name
              : 'Guest',
          style: const TextStyle(color: Colors.white),
        ),
        accountEmail: null,
        currentAccountPicture: GestureDetector(
          onTap: () async {
            // جلب صورة جديدة عند الضغط
            final picker = ImagePicker();
            final pickedFile = await picker.pickImage(source: ImageSource.gallery);

            if (pickedFile != null) {
              // تحديث صورة الملف الشخصي في الـ Controller
              menuController.updateProfileImage(pickedFile.path);
            }
          },
          child: CircleAvatar(
            backgroundImage: menuController.user.value.profileImage.isNotEmpty
                ? FileImage(File(menuController.user.value.profileImage)) // استخدم FileImage إذا كانت الصورة محلية
                : const AssetImage('assets/images/default_profile.png') as ImageProvider, // صورة افتراضية
            child: menuController.user.value.profileImage.isEmpty
                ? const Icon(Icons.person, size: 40)
                : null,
          ),
        ),
        decoration: const BoxDecoration(
          color: AppColor.black,
        ),
      ),
    );
  }


  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColor.white),
      title: Text(
        title,
        style: const TextStyle(color: AppColor.white),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: AppColor.white),
      onTap: onTap,
    );
  }
}
