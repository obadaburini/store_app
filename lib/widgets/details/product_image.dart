import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.image,
    required this.label,
    required this.productId,
  });
  final String image;
  final String label;
  final int productId;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(24),
    child: AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Hero(
            tag: 'product-$productId',
            child: Image.asset(
              image,
              semanticLabel: label,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    ),
  );
}
