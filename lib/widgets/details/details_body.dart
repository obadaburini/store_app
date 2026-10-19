import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../constants.dart';
import '../../cart/cart_provider.dart';
import 'product_image.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final image = ProductImage(
                image: product.image,
                label: product.title,
                productId: product.id,
              );
              final content = Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      formatPrice(product.price),
                      style: const TextStyle(
                        fontSize: 20,
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      product.description,
                      style: const TextStyle(height: 1.9),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add_shopping_cart),
                        label: const Text('إضافة إلى السلة'),
                        onPressed: () {
                          context.read<CartProvider>().add(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'تمت إضافة "${product.title}" إلى السلة',
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
              return Padding(
                padding: const EdgeInsets.all(16),
                child: constraints.maxWidth >= 760
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: image),
                          Expanded(child: content),
                        ],
                      )
                    : Column(
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 340),
                            child: image,
                          ),
                          content,
                        ],
                      ),
              );
            },
          ),
        ),
      ),
    ),
  );
}
