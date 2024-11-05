
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ConstData {
  static bool isLogin = false;
  static String token = "";
  static Timer? _tokenTimer;

  // دالة لتحديث التوكن
  static Future<void> updateToken() async {
    const String clientId = ''; // أدخل معرف العميل الخاص بك هنا
    const String clientSecret = ''; // أدخل السر الخاص بالعميل هنا

    final response = await http.post(
      Uri.parse('https://test.api.amadeus.com/v1/security/oauth2/token'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'client_credentials',
        'client_id': clientId,
        'client_secret': clientSecret,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      token = data['access_token'];
      isLogin = true;
      print('Token updated: $token');

      // تخزين التوكن في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("access_token", token);
    } else {
      print('Failed to obtain access token: ${response.statusCode}');
      print('Response body: ${response.body}');
      isLogin = false;
    }
  }

  // دالة لبدء تحديث التوكن بشكل دوري
  static void startTokenUpdater() {
    stopTokenUpdater(); // التأكد من عدم وجود مؤقت نشط سابق
    _tokenTimer = Timer.periodic(const Duration(seconds: 20), (timer) async {
      await updateToken();
    });
  }

  // دالة لإيقاف المؤقت
  static void stopTokenUpdater() {
    _tokenTimer?.cancel();
    _tokenTimer = null;
  }
}