import 'package:flutter/material.dart';
import 'package:provider_sampleapp/data/model/product.dart';
import 'package:provider_sampleapp/data/remote/api_status.dart';
import 'package:provider_sampleapp/data/remote/product_api_impl.dart';

class ProductViewModel extends ChangeNotifier {
  ProductViewModel() {
    fetchProducts();
  }

  bool _loading = false;
  List<Product> _productList = [];
  Failure? _productError;

  bool get loading => _loading;
  List<Product> get productList => _productList;
  Failure? get productError => _productError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setProductList(List<Product> productList) {
    _productList = productList;
    notifyListeners();
  }

  setProductError(Failure error){
    _productError=error;
    notifyListeners();
  }

  /// product api call
  fetchProducts() async {
    setLoading(true);
    var response = await ProductApiImple().getProducts();
    if (response is Success) {
      setProductList(response.successResponse as List<Product>);
    }else{
      setProductError(response as Failure);
    }
    setLoading(false);
  }
}
