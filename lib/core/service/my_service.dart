import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task6/model/produt_model.dart';

class MyService extends GetxService {
late SharedPreferences sharedPreferences;

 Future<MyService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }


   Future<void> saveFavorites(List<Datum> favoriteItems) async {
    List<String> favoriteIds =
        favoriteItems.map((item) => item.id.toString()).toList();
    await sharedPreferences.setStringList('favorites', favoriteIds);
  }

    Future<List<String>> loadFavorites() async {
    return sharedPreferences.getStringList('favorites') ?? [];
  }


  static initialServices() async {
  await Get.putAsync(() => MyService().init());
}
}
