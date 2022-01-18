import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_sampleapp/data/model/product.dart';
import 'package:provider_sampleapp/data/model/user.dart';
import 'package:provider_sampleapp/data/remote/api_status.dart';
import 'package:provider_sampleapp/data/remote/product_api.dart';

class ProductApiImple extends ProductAPI {
  static const String PRODUCT_ENDPOINT = "https://fakestoreapi.com/products";

  @override
  Future<Object> getProducts() async {
    List<Product> productList = [];
    var response = await http.get(Uri.parse(PRODUCT_ENDPOINT));
    if (response.statusCode == 200) {
      List products = jsonDecode(response.body);
      productList = products.map((e) => Product.fromJson(e)).toList();
      return Success(successResponse: productList);
    } else {
      return Failure(errorResponse: 'Can\'t fetch product from server.',code: response.statusCode);
    }
  }

  @override
  Future<Object> getUsers() async {
    List<User> userList = [];
    var response = await http.get(Uri.parse('https://fakestoreapi.com/users'));
    if (response.statusCode == 200) {
      List users = jsonDecode(response.body);
      userList = users.map((e) => User.fromJson(e)).toList();
      return Success(successResponse: userList);
    } else {
      return Failure(errorResponse: 'Can\'t fetch users from server.',code: response.statusCode);
    }
  }
}
