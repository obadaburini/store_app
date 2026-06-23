import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';
import '../../constants.dart';

class ProductCard extends StatelessWidget {
  final int itemIndex;
  final Product product;
  final VoidCallback press;

  const ProductCard({
    super.key,
    required this.itemIndex,
    required this.product,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      height: 210.0, // ✅ زودنا شوي عشان الشاشات الصغيرة
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 25,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),

            // صورة المنتج
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 170.0,
                width: 200.0,
                alignment: Alignment.center,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // معلومات المنتج
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: 150.0,
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Text(
                        product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Text(
                        product.subTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),

                    const Spacer(), // ✅ Spacer واحد فقط

                    Padding(
                      padding: const EdgeInsets.only(
                        right: kDefaultPadding,
                        left: kDefaultPadding,
                        bottom: kDefaultPadding,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Text(
                            'السعر: \$${product.price}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
