import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/product.dart';
import '../widgets/details/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: kPrimaryColor,
    appBar: AppBar(title: const Text('تفاصيل المنتج')),
    body: DetailsBody(product: product),
  );
}
