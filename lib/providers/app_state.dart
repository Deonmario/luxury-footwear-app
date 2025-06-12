import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int cartCount = 0;

  void addToCart() {
    cartCount++;
    notifyListeners();
  }

  void removeFromCart() {
    if (cartCount > 0) {
      cartCount--;
      notifyListeners();
    }
  }

  void clearCart() {
    cartCount = 0;
    notifyListeners();
  }
}
