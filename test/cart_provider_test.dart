import 'package:flutter_test/flutter_test.dart';
import 'package:store_app/cart/cart_provider.dart';
import 'package:store_app/models/product.dart';

void main() {
  test('adding the same product updates quantity, badge count, and total', () {
    final cart = CartProvider();
    cart.add(products[0]);
    cart.add(products[0]);
    cart.add(products[1]);
    expect(cart.items.length, 2);
    expect(cart.totalQuantity, 3);
    expect(cart.totalPrice, products[0].price * 2 + products[1].price);
  });

  test('remove deletes the complete line even when quantity exceeds two', () {
    final cart = CartProvider();
    for (var index = 0; index < 5; index++) {
      cart.add(products[0]);
    }
    cart.add(products[1]);
    cart.remove(products[0]);
    expect(cart.items.single.product.id, products[1].id);
    expect(cart.totalQuantity, 1);
    expect(cart.totalPrice, products[1].price);
  });

  test('decrease removes a final unit without negative quantities', () {
    final cart = CartProvider();
    cart.add(products[0]);
    cart.add(products[0]);
    cart.decrease(products[0]);
    expect(cart.items.single.quantity, 1);
    cart.decrease(products[0]);
    cart.decrease(products[0]);
    expect(cart.items, isEmpty);
    expect(cart.totalPrice, 0);
  });

  test('clear empties cart and callers cannot mutate the item list', () {
    final cart = CartProvider()..add(products[0]);
    expect(() => cart.items.clear(), throwsUnsupportedError);
    cart.clear();
    expect(cart.totalQuantity, 0);
    expect(cart.items, isEmpty);
  });
}
