import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/product.dart';
import '../../screens/details_screen.dart';
import 'product_cart.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: [
                // الخلفية البيضاء مع الزوايا
                Positioned.fill(
                  top: 70,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),

                // قائمة المنتجات
                ListView.builder(
                  padding: const EdgeInsets.only(
                    top: kDefaultPadding,
                    bottom: kDefaultPadding,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      itemIndex: index,
                      product: product,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailsScreen(product: product),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
