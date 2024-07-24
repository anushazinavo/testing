import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, Object>> _cart = [];

  List<Map<String, Object>> get cart => _cart;

  void addToCart(Map<String, Object> product) {
    int index = _cart.indexWhere((item) => item['id'] == product['id']);
    if (index != -1) {
      _cart[index]['quantity'] = (_cart[index]['quantity'] as int) + 1;
    } else {
      product['quantity'] = 1;
      _cart.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(Map<String, Object> product) {
    int index = _cart.indexWhere((item) => item['id'] == product['id']);
    if (index != -1 && _cart[index]['quantity'] as int > 1) {
      _cart[index]['quantity'] = (_cart[index]['quantity'] as int) - 1;
    } else {
      _cart.removeAt(index);
    }
    notifyListeners();
  }

  void deleteFromCart(Map<String, Object> product) {
    _cart.removeWhere((item) => item['id'] == product['id']);
    notifyListeners();
  }

  double calculateTotalAmount() {
    double total = 0;
    for (var item in _cart) {
      total += (item['price'] as double) * (item['quantity'] as int);
    }
    return total;
  }

  int getTotalItemCount() {
    int totalCount = 0;
    for (var item in _cart) {
      totalCount += item['quantity'] as int;
    }
    return totalCount;
  }
}
