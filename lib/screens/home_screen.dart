import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart/cart_provider.dart';
import '../cart/cart_screen.dart';
import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        'متجر الإلكترونيات',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        Consumer<CartProvider>(
          builder: (context, cart, _) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 16),
            child: IconButton(
              tooltip: 'فتح السلة',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (_) => const CartScreen()),
              ),
              icon: Badge(
                isLabelVisible: cart.totalQuantity > 0,
                label: Text('${cart.totalQuantity}'),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ),
        ),
      ],
    ),
    body: const HomeBody(),
  );
}
