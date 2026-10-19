import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('السلة')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: cart.items.isEmpty
                ? _emptyCart(context)
                : Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(20),
                          itemCount: cart.items.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final item = cart.items[index];
                            return Card(
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          item.product.image,
                                          width: 64,
                                          height: 64,
                                          fit: BoxFit.contain,
                                          excludeFromSemantics: true,
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.product.title,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                '${formatPrice(item.product.price)} × ${item.quantity}',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(height: 24),
                                    Wrap(
                                      spacing: 8,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        IconButton(
                                          tooltip:
                                              'تقليل كمية ${item.product.title}',
                                          onPressed: () =>
                                              cart.decrease(item.product),
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                          ),
                                        ),
                                        Semantics(
                                          liveRegion: true,
                                          label: 'الكمية',
                                          child: Text(
                                            '${item.quantity}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          tooltip:
                                              'زيادة كمية ${item.product.title}',
                                          onPressed: () =>
                                              cart.add(item.product),
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                          ),
                                        ),
                                        IconButton(
                                          tooltip: 'حذف ${item.product.title}',
                                          onPressed: () =>
                                              cart.remove(item.product),
                                          icon: const Icon(
                                            Icons.delete_outline,
                                          ),
                                          color: Colors.red.shade700,
                                        ),
                                        Text(
                                          formatPrice(
                                            item.product.price * item.quantity,
                                          ),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 20,
                          runSpacing: 12,
                          children: [
                            Text(
                              'المجموع: ${formatPrice(cart.totalPrice)}',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            OutlinedButton.icon(
                              onPressed: () => _confirmClear(context),
                              icon: const Icon(
                                Icons.remove_shopping_cart_outlined,
                              ),
                              label: const Text('إفراغ السلة'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _emptyCart(BuildContext context) => Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.shopping_bag_outlined, size: 80, color: kPrimaryColor),
        const SizedBox(height: 20),
        Text('السلة فارغة', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        const Text(
          'اختر منتجاتك المفضلة من المتجر لتظهر هنا.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('تصفح المنتجات'),
        ),
      ],
    ),
  );

  Future<void> _confirmClear(BuildContext context) async {
    final cart = context.read<CartProvider>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إفراغ السلة؟'),
        content: const Text('سيتم حذف جميع المنتجات من السلة.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('إفراغ السلة'),
          ),
        ],
      ),
    );
    if (confirmed == true) cart.clear();
  }
}
