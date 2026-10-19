import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_app/main.dart';
import 'package:store_app/widgets/product_card.dart';

void main() {
  testWidgets('browse details, add five units, delete line, and browse again', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(
      Directionality.of(tester.element(find.byType(ProductCard).first)),
      TextDirection.rtl,
    );
    await tester.tap(find.byType(ProductCard).first);
    await tester.pumpAndSettle();
    final add = find.text('إضافة إلى السلة');
    await tester.ensureVisible(add);
    for (var count = 0; count < 5; count++) {
      await tester.ensureVisible(add);
      await tester.tap(add);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('فتح السلة'));
    await tester.pumpAndSettle();
    expect(find.text('المجموع: 295 درهم'), findsOneWidget);
    await tester.tap(find.byTooltip('حذف سماعات لاسلكية'));
    await tester.pumpAndSettle();
    expect(find.text('السلة فارغة'), findsOneWidget);
    await tester.tap(find.text('تصفح المنتجات'));
    await tester.pumpAndSettle();
    expect(find.byType(ProductCard), findsNWidgets(6));
    expect(tester.takeException(), isNull);
  });

  for (final size in [const Size(320, 640), const Size(1440, 1000)]) {
    testWidgets('catalog and empty cart render without overflow at $size', (
      tester,
    ) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      expect(find.byType(ProductCard), findsNWidgets(6));
      expect(tester.takeException(), isNull);
      await tester.tap(find.byTooltip('فتح السلة'));
      await tester.pumpAndSettle();
      expect(find.text('السلة فارغة'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
