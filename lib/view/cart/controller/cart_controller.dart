import 'dart:convert';
import 'package:get/get.dart';
import 'package:task6/core/service/link.dart';
import 'package:task6/model/order_model.dart' as order;
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  int subTotal = 0;
  int total = 0;
  int deliveryp = 0;
  @override
  onInit() {
    super.onInit();
    fetchItems();
    subTotall();
  }

  int subTotall() {
    subTotal = 0;
    for (var item in cartItems) {
      subTotal += item.peoduct.price * item.quantity;
    }
    return subTotal;
  }

  int TotalCoast() {
    total = 0;
    total = subTotal += deliveryp;
    return total;
  }

  int getTotalItems() {
    int totalItems = 0;
    for (var item in cartItems) {
      totalItems += item.quantity;
    }
    return totalItems;
  }

  int delivery() {
     deliveryp = 0;
    if (subTotal != 0) {
      deliveryp = 60;
    }
    return deliveryp;
  }


  List<order.Datum> cartItems = [];
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

  Future<void> updateOrder(order.Datum productOrder, int x) async {
    print("kkkkkkkkk${productOrder.quantity}");
    int pq;
    try {
      if (x == 1) {
        pq = productOrder.quantity + 1;
      } else {
        pq = productOrder.quantity - 1;
      }

      print("nnnnnnnnnnnnnnn$pq");

      if (pq < 1) {
        await deleteOrder(productOrder.id);
        return;
      }
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

  Future<void> deleteOrder(int id) async {
    try {
      final response = await http.delete(
        Uri.parse("${AppLink.createOrder}/$id"),
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization":
              "Bearer 1239|MiR7tofBmoVfUTs08hzDVncRT1Hl7bXIOav4ah4R0fad9c0f",
        },
      );

      if (response.statusCode == 200) {
        cartItems.removeWhere((item) => item.id == id);
        update();
        print('Order deleted successfully');

      } else {
        print('Failed to update order: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}


  
  

  





  

  















