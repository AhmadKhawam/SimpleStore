import '../const_data/const_data.dart';

class AppLink {
  static String reg = "127.0.0.1";

  static String appRoot = "https://task.focal-x.com";

  static String appApi = "$appRoot/api";
  static String register = "$appApi/register";
  static String login = "$appApi/login";
  static String logout = "$appApi/logout";

  // static String imageWithRoot = "$appRoot/storage/";
  // static String imageWithoutRoot = "$appRoot";

  // static String login = "$appApi/login";
  // static String home = "$appApi/home";
  static String categories = "$appApi/categories";
  static String product = "$appApi/products";
  static String createOrder = "$appApi/orders";
  // static String updateOrder = orders/



  Map<String, String> getHeader() {
    Map<String, String> mainHeader = {
      'Content - Type': 'application/json',
      ' Accept': 'application/json',
      ' x - Requested - with': 'XMLHttpRequest',
    };
    return mainHeader;
  }

  Map<String, String> getHeaderToken() {
    Map<String, String> mainHeader = {
      'Content - Type': 'application/json',
      ' Accept': 'application/json',
      ' x - Requested - with': 'XMLHttpRequest',
      'Autherization': 'Bearer ${ConstData.token}',
    };
    return mainHeader;
  }
}
