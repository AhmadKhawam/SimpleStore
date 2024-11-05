// search_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'search_controller.dart'; // استيراد المتحكم

class SearchPage extends StatelessWidget {
 // final SearchController searchController = Get.find<SearchController>();
  final SerchController searchController = Get.find<SerchController>();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // العودة إلى الصفحة السابقة
          },
        ),
        title: TextField(
          controller: searchController.textController, // ربط الـ TextEditingController بحقل النص
          decoration: InputDecoration(
            hintText: 'Search Your Shirt',
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: IconButton(
              icon: const Icon(Icons.mic, color: Colors.grey),
              onPressed: () {
                // تنفيذ منطق الميكروفون
              },
            ),
          ),
          onChanged: (value) {
            searchController.updateResults(value); // تحديث نتائج البحث
          },
        ),
        actions: [
          Obx(() => searchController.query.value.isNotEmpty
              ? TextButton(
            onPressed: () {
              searchController.clearSearch(); // تفريغ البحث والنص
            },
            child: const Text('Cancel',
                style: TextStyle(color: Colors.green)),
          )
              : const SizedBox.shrink()), // إخفاء زر التفريغ إذا لم يكن هناك استعلام
        ],
      ),
      body: Obx(
            () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (searchController.searchResults.isNotEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  'Shirt',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            Expanded(
              child: searchController.searchResults.isEmpty
                  ? const Center(
                child: Text('No results found',
                    style: TextStyle(color: Colors.grey)),
              )
                  : ListView.builder(
                itemCount: searchController.searchResults.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.access_time,
                            color: Colors.grey),
                        title: Text(searchController.searchResults[index],
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 16)),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 16,
                        endIndent: 16,
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
