import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/cart/cart_provider.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  const DetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          // صورة المنتج
          Container(
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            height: size.width * 0.8,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: size.width * 0.7,
                  width: size.width * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Image.asset(
                  product.image,
                  height: size.width * 0.75,
                  width: size.width * 0.75,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          // الكارد الأبيض
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                Text(
                  "السعر: \$${product.price}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  product.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 30),

                // زر إضافة للسلة
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CartProvider>().add(product);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'تمت إضافة "${product.title}" إلى السلة 🛒',
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Text(
                      "إضافة إلى السلة",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
