import 'dart:async';

class CartViewModel {
  int _cartCount = 0;

  final StreamController<int> _cartCountController = StreamController();
  Stream<int> get cartCountStream => _cartCountController.stream;

  void updateSecond() {
    _cartCountController.sink.add(_cartCount++);
  }

  void dispose() {
    _cartCountController.close();
  }
}