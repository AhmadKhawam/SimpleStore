import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task6/core/const_data/const_data.dart';
import 'package:task6/core/service/link.dart';

// نموذج المستخدم
class UserModel {
  String? email;
  String? password;
  String? name;

  UserModel({this.email, this.password, this.name});
}

// وحدة التحكم للمصادقة
class AuthController extends GetxController {
  final userModel = UserModel().obs; // حالة المستخدم

  // المتحكمات لنماذج الإدخال
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  var isPasswordVisible = false.obs; // حالة رؤية كلمة المرور

  // متغير لتخزين FCM Token
  var fcmToken = ''.obs;

  // دالة لتبديل رؤية كلمة المرور
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
    getFcmToken(); // جلب FCM Token عند تهيئة الوحدة
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }

  // دالة لجلب FCM Token
  Future<void> getFcmToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    if (token != null) {
      fcmToken.value = token; // تخزين التوكن
      print("FCM Token: $token");
    } else {
      print("Failed to get FCM Token");
    }
  }

  // دالة للحصول على التوكن من SharedPreferences
  Future<String?> getAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("access_token");
  }

  // دالة لتخزين التوكن في SharedPreferences
  Future<void> storeAccessToken(String accessToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("access_token", accessToken);

    ConstData.token = accessToken; // تحديث التوكن في ConstData
  }

  // دالة لتسجيل الدخول
  Future<bool> login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var loginData = {
        'email': emailController.text,
        'password': passwordController.text,
        'fcm_token': fcmToken.value, // استخدام التوكن الديناميكي
      };

      try {
        var response = await http.post(
          Uri.parse(AppLink.login),
          headers: {"Content-Type": "application/json"},
          body: json.encode(loginData),
        );

        if (response.statusCode == 200) {
          var jsonData = json.decode(response.body);
          print("Login Successful: $jsonData");

          String accessToken = jsonData['data']['access_token'];
          await storeAccessToken(accessToken);

          userModel.value = UserModel(
            email: emailController.text,
            password: passwordController.text,
            name: jsonData['data']['name'],
          );

          Get.snackbar("Success", "Login successful");
          return true; // النجاح
        } else {
          var errorData = json.decode(response.body);
          Get.snackbar("Error",
              errorData['message'] ?? "Login failed, please try again.");
          return false; // الفشل
        }
      } catch (e) {
        print("Login Error: $e");
        Get.snackbar("Error", "An error occurred. Please try again.");
        return false; // الفشل
      }
    } else {
      Get.snackbar("Error", "Please fill all fields");
      return false; // الفشل
    }
  }

  // دالة للتسجيل
  Future<void> register() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty) {
      var registerData = {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'fcm_token': fcmToken.value, // استخدام التوكن الديناميكي
      };

      try {
        var response = await http.post(
          Uri.parse(AppLink.register),
          headers: {"Content-Type": "application/json"},
          body: json.encode(registerData),
        );

        if (response.statusCode == 200) {
          var jsonData = json.decode(response.body);
          print("Registration Successful: $jsonData");

          String accessToken = jsonData['data']['access_token'];
          await storeAccessToken(accessToken);

          userModel.value = UserModel(
            email: emailController.text,
            password: passwordController.text,
            name: nameController.text,
          );

          Get.snackbar("Success", "Registration successful");
        } else {
          var errorData = json.decode(response.body);
          Get.snackbar("Error",
              errorData['message'] ?? "Registration failed, please try again.");
        }
      } catch (e) {
        print("Registration Error: $e");
        Get.snackbar("Error", "An error occurred. Please try again.");
      }
    } else {
      Get.snackbar("Error", "Please fill all fields");
    }
  }
}
