import 'package:flutter/foundation.dart';
import 'package:store_app/models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  void add(Product product) {
    final index = _items.indexWhere((e) => e.product.id == product.id);

    if (index == -1) {
      _items.add(CartItem(product: product, quantity: 1));
    } else {
      _items[index].quantity += 1;
    }
    notifyListeners();
  }

  void decrease(Product product) {
    final index = _items.indexWhere((e) => e.product.id == product.id);
    if (index == -1) return;

    if (_items[index].quantity > 1) {
      _items[index].quantity -= 1;
    } else {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
