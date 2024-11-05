import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart 'as http;
import 'package:task6/core/class/check_internat.dart';

import 'status_request.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String LinkUrl, Map data, Map<String, String> header) async {
    try {
      if (await isInternetConnected()) {
        var response = await http.post(
          Uri.parse(LinkUrl),
          body: jsonEncode(data),
          headers: header,
        );
        print(response);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } catch (_) {
      print(_);
      return const Left(StatusRequest.serverFailure);
    }
  }
}
