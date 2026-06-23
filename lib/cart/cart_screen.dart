import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("السلة"),
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text("السلة فارغة"),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];

                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(item.product.title),
                          subtitle: Text(
                              "${item.product.price} × ${item.quantity}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  cart.decrease(item.product);
                                },
                              ),
                              Text(item.quantity.toString()),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  cart.add(item.product);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  cart.decrease(item.product);
                                  cart.decrease(item.product);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "المجموع: ${cart.totalPrice} درهم",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          cart.clear();
                        },
                        child: const Text("إفراغ السلة"),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
