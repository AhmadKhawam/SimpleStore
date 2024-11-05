
import 'dart:convert';

class OrderModel {
    List<Datum> data;
    String message;

    OrderModel({
        required this.data,
        required this.message,
    });

    factory OrderModel.fromRawJson(String str) => OrderModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    int id;
    Peoduct peoduct;
    User user;
    int quantity;

    Datum({
        required this.id,
        required this.peoduct,
        required this.user,
        required this.quantity,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) {

      final dynamicQuantity = json["quantity"];
    int parsedQuantity;

    if (dynamicQuantity is String) {
      parsedQuantity = int.tryParse(dynamicQuantity) ?? 0;
    } else if (dynamicQuantity is int) {
      parsedQuantity = dynamicQuantity;
    } else {
      parsedQuantity = 0; // Default value or handle error
    }
      return 
    Datum(
        id: json["id"],
        peoduct: Peoduct.fromJson(json["peoduct"]),
        user: User.fromJson(json["user"]),
        quantity: parsedQuantity,
    );} 

    Map<String, dynamic> toJson() => {
        "id": id,
        "peoduct": peoduct.toJson(),
        "user": user.toJson(),
        "quantity": quantity,
    };
}

class Peoduct {
    int id;
    String name;
    SubCategory subCategory;
    String image;
    int price;
    int evaluation;
    int discount;

    Peoduct({
        required this.id,
        required this.name,
        required this.subCategory,
        required this.image,
        required this.price,
        required this.evaluation,
        required this.discount,
    });

    factory Peoduct.fromRawJson(String str) => Peoduct.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Peoduct.fromJson(Map<String, dynamic> json) => Peoduct(
        id: json["id"],
        name: json["name"],
        subCategory: SubCategory.fromJson(json["sub-category"]),
        image: json["image"],
        price: json["price"],
        evaluation: json["evaluation"],
        discount: json["discount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sub-category": subCategory.toJson(),
        "image": image,
        "price": price,
        "evaluation": evaluation,
        "discount": discount,
    };
}

class SubCategory {
    int id;
    String name;
    User category;

    SubCategory({
        required this.id,
        required this.name,
        required this.category,
    });

    factory SubCategory.fromRawJson(String str) => SubCategory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
        category: User.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category.toJson(),
    };
}

class User {
  int id;
  String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

