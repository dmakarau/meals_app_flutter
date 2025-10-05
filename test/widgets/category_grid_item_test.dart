import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals/models/category.dart';
import 'package:meals/widgets/category_grid_item.dart';

void main() {
  group('CategoryGridItem widget', () {
    testWidgets('displays category title', (WidgetTester tester) async {
      const category = Category(
        id: 'c1',
        title: 'Italian',
        color: Colors.red,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryGridItem(
              category: category,
              onSelectCategory: () {},
            ),
          ),
        ),
      );

      expect(find.text('Italian'), findsOneWidget);
    });

    testWidgets('calls onSelectCategory when tapped', (WidgetTester tester) async {
      const category = Category(
        id: 'c1',
        title: 'Italian',
      );

      bool wasCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryGridItem(
              category: category,
              onSelectCategory: () {
                wasCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      expect(wasCalled, isTrue);
    });

    testWidgets('has InkWell with rounded border', (WidgetTester tester) async {
      const category = Category(
        id: 'c1',
        title: 'Italian',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryGridItem(
              category: category,
              onSelectCategory: () {},
            ),
          ),
        ),
      );

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      expect(inkWell.borderRadius, isNotNull);
    });

    testWidgets('container has gradient decoration', (WidgetTester tester) async {
      const category = Category(
        id: 'c1',
        title: 'Italian',
        color: Colors.blue,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryGridItem(
              category: category,
              onSelectCategory: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.text('Italian'),
          matching: find.byType(Container),
        ),
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.gradient, isA<LinearGradient>());
      expect(decoration.borderRadius, isNotNull);
    });

    testWidgets('throws assertion error for empty title', (WidgetTester tester) async {
      expect(
        () => CategoryGridItem(
          category: const Category(id: 'c1', title: ''),
          onSelectCategory: () {},
        ),
        throwsAssertionError,
      );
    });
  });
}
