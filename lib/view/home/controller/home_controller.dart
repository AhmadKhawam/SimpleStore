import 'dart:convert';
import 'package:get/get.dart';
import 'package:task6/core/service/link.dart';
import 'package:task6/core/service/my_service.dart';
import 'package:task6/model/category_model.dart' as category;
import 'package:task6/model/produt_model.dart' as product;
import 'package:task6/model/order_model.dart' as order;
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
final MyService myService = Get.find<MyService>(); 
  @override
  onInit() {
    super.onInit();
    fetchCategories();
    fetchItems();
    fetchProducts().then((_) {
      loadFavorites();
    });
  }

  List<product.Datum> favoriteItems = [];
  List<category.Datum> categoryResponse = [];
  List<product.Datum> productResponse = [];
  List<order.Datum> cartItems = [];

  void toggleFavorite(product.Datum product) async {
    if (favoriteItems.contains(product)) {
      favoriteItems.remove(product);
    } else {
      favoriteItems.add(product);
    }
    update();
    myService.saveFavorites(favoriteItems);
  }

  bool isFavorite(product.Datum product) {
    return favoriteItems.contains(product);
  }
  
    Future<void> loadFavorites() async {
    List<String> favoriteIds = await myService.loadFavorites(); 
    favoriteItems = productResponse
        .where((item) => favoriteIds.contains(item.id.toString()))
        .toList();
    update();
  }

  void goToCartPage() {
    Get.toNamed('/cartScreen')!.then((_) {
      fetchItems();
    });
  }

  goToPageProductDetails(productResponse) {
    Get.toNamed('/detailsScreen', arguments: {'product': productResponse});
  }

  Future<void> fetchCategories() async {
    var url = Uri.parse(AppLink.categories);
    try {
      final response = await http.get(url, headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer 1239|MiR7tofBmoVfUTs08hzDVncRT1Hl7bXIOav4ah4R0fad9c0f",
      });
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        categoryResponse = category.CategoryModel.fromJson(jsonResponse).data;
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  Future<void> fetchProducts() async {
    var url = Uri.parse(AppLink.product);
    try {
      final response = await http.get(url, headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer 1239|MiR7tofBmoVfUTs08hzDVncRT1Hl7bXIOav4ah4R0fad9c0f",
      });
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        productResponse = product.Product.fromJson(jsonResponse).data;
      }
    } catch (e) {
      print(e);
    }
    update();
  }








  Future<void> fetchItems() async {
    cartItems.clear();
    var url = Uri.parse(AppLink.createOrder);
    try {
      final response = await http.get(url, headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer 1239|MiR7tofBmoVfUTs08hzDVncRT1Hl7bXIOav4ah4R0fad9c0f",
      });
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        final x = order.OrderModel.fromJson(jsonResponse).data;
        for (var item in x) {
          cartItems.add(item);
        }
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  Future<void> addToCart(product.Datum product) async {
    try {
      var existingItemIndex = cartItems.indexWhere(
        (item) => item.peoduct.id == product.id,
      );
      print(existingItemIndex);
      if (existingItemIndex != -1) {
        print(cartItems[existingItemIndex].id);
        updateOrder(
          cartItems[existingItemIndex],
        );
      } else {
        final response = await http
            .post(Uri.parse(AppLink.createOrder), headers: <String, String>{
          "Accept": "application/json",
          "Authorization":
              "Bearer 1239|MiR7tofBmoVfUTs08hzDVncRT1Hl7bXIOav4ah4R0fad9c0f",
        }, body: {
          "product_id": "${product.id}",
          "quantity": "1",
        });

        print('Response: ${response.body}');
        if (response.statusCode == 200) {
          final jsonResponse = jsonDecode(response.body);
          if (jsonResponse['data'] != null) {
            final order.Datum datum =
                order.Datum.fromJson(jsonResponse['data']);
            cartItems.add(datum);
            print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm${datum.quantity}");
          } else {
            print('Error: Data is null');
          }
        } else {
          print('Failed to add to cart: ${response.statusCode}');
        }
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  Future<void> updateOrder(
    order.Datum productOrder,
  ) async {
    print("kkkkkkkkk${productOrder.quantity}");
    try {
      int pq = productOrder.quantity + 1;

      print("nnnnnnnnnnnnnnn$pq");
      final response = await http.put(
          Uri.parse("${AppLink.createOrder}/${productOrder.id}"),
          headers: <String, String>{
            "Accept": "application/json",
            "Authorization":
                "Bearer 1239|MiR7tofBmoVfUTs08hzDVncRT1Hl7bXIOav4ah4R0fad9c0f",
            "Content-Type": "application/x-www-form-urlencoded",
          },
          body: {
            "quantity": pq.toString(),
          });

      if (response.statusCode == 200) {
        print('Order updated successfully');
        productOrder.quantity = pq;
        update();
      } else {
        print('Failed to update order: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
