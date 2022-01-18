import 'package:provider_sampleapp/data/model/product.dart';

abstract class ProductAPI
{
  Future<Object> getProducts();
  Future<Object> getUsers();
}