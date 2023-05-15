import 'package:coffeshop/model/menus.dart';
import 'package:flutter/material.dart';

class CoffeProvider extends ChangeNotifier {
  int _selectedNavbar = 0;
  int qty = 1;
  String sizeCup = 'S';
  List cartItems = [];
  List orderData = [];

  get selectedNavbar => _selectedNavbar;

  void changeSelectedNavBar(int index) {
    _selectedNavbar = index;
    notifyListeners();
  }

  void clearCartItems() {
    cartItems.clear();
    notifyListeners();
  }

  void selectOrder(String name, int price, String size, String image) {
    qty = 1;
    sizeCup = 'S';
    orderData.clear();
    orderData.add(Menus(name: name, price: price, size: size, image: image));
    notifyListeners();
  }

  addCart(String name, int price, int qty, String size, String image) {
    cartItems.add(
        Menus(name: name, price: price, qty: qty, size: size, image: image));
  }

  adjustQty(String adjust) {
    if (qty >= 1 && adjust == '+') {
      qty += 1;
    } else if (qty > 1 && adjust == '-') {
      qty -= 1;
    } else {}
    notifyListeners();
  }

  changeSize(String size) {
    sizeCup = size;
    notifyListeners();
  }
}
