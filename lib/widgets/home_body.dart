import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/details_screen.dart';
import 'product_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1160),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أهلاً بك في متجرك',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text('اكتشف أجهزة وإكسسوارات تناسب يومك'),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 1040
                      ? 3
                      : constraints.maxWidth >= 680
                      ? 2
                      : 1;
                  final width =
                      (constraints.maxWidth - (columns - 1) * 20) / columns;
                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: products
                        .map(
                          (product) => SizedBox(
                            width: width,
                            child: ProductCard(
                              product: product,
                              press: () => Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (_) =>
                                      DetailsScreen(product: product),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
