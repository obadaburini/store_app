import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:store_app/cart/cart_provider.dart';
import 'package:store_app/cart/cart_screen.dart'; // ✅ أضفنا هذا
import 'package:store_app/constants.dart';
import 'package:store_app/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: _buildAppBar(context),
      body: const HomeBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'مرحبا بكم بمتجر الالكترونيات',
        style: GoogleFonts.almarai(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        // 🛒 سلة + Badge
        Consumer<CartProvider>(
          builder: (context, cart, _) {
            final totalQty =
                cart.items.fold<int>(0, (sum, item) => sum + item.quantity);

            return Stack(
              alignment: Alignment.topLeft,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    // ✅ فتح شاشة السلة
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CartScreen(),
                      ),
                    );
                  },
                ),
                if (totalQty > 0)
                  Positioned(
                    left: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$totalQty',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),

        const Padding(
          padding: EdgeInsets.only(left: kDefaultPadding),
          child: Icon(Icons.menu, color: Colors.white),
        ),
      ],
    );
  }
}
