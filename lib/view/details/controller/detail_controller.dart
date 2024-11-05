import 'package:get/get.dart';
import 'package:task6/model/produt_model.dart';
import 'package:task6/view/home/controller/home_controller.dart';

class DetailController extends GetxController {
  HomeController hController = Get.find();

  late Datum product;
  initialProduct() {
    product = Get.arguments['product'];
  }


  void goToCartPage() {
    Get.toNamed('/cartScreen')!.then((_) {
     hController.fetchItems(); 
    });
  }



    void toggleFavorite( product) {
    if (hController.favoriteItems.contains(product)) {
      hController.favoriteItems.remove(product);
    } else {
      hController.favoriteItems.add(product);
    }
     hController.update();
    update();
  }
    void addToCart() async {
    await hController.addToCart(product);
    update();
  }

  @override
  void onInit() {
    initialProduct();
    super.onInit();
  }
}
