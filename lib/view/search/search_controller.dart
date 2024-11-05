// search_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SerchController extends GetxController {
  var query = ''.obs; // تعريف استعلام البحث بصفة observable
  var searchResults = <String>[].obs;
  TextEditingController textController = TextEditingController(); // للتحكم في حقل النص

  // دالة لتحديث النتائج بناءً على المدخل
  void updateResults(String searchQuery) {
    query.value = searchQuery;

    // منطق البحث المؤقت - يمكن استبداله بنتائج حقيقية لاحقًا
    if (searchQuery.isEmpty) {
      searchResults.clear();
    } else {
      searchResults.value = [
        'New T-Shirt',
        'Top T-Shirt',
        'Programmer',
        'Shirt',
        'Black Shirt',
        'White Shirt'
      ].where((item) =>
          item.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    }
  }

  void clearSearch() {
    query.value = '';
    searchResults.clear();
    textController.clear(); // تفريغ محتوى حقل النص
  }
}
