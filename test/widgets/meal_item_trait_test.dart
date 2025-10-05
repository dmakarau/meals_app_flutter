import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals/widgets/meal_item_trait.dart';

void main() {
  group('MealItemTrait widget', () {
    testWidgets('displays icon and label', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MealItemTrait(
              icon: Icons.schedule,
              label: '30 min',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.schedule), findsOneWidget);
      expect(find.text('30 min'), findsOneWidget);
    });

    testWidgets('icon has correct size and color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MealItemTrait(
              icon: Icons.work,
              label: 'Simple',
            ),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.work));
      expect(iconWidget.size, 17);
      expect(iconWidget.color, Colors.white);
    });

    testWidgets('text has correct color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MealItemTrait(
              icon: Icons.attach_money,
              label: 'Affordable',
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Affordable'));
      expect(textWidget.style?.color, Colors.white);
    });

    testWidgets('displays in a Row layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MealItemTrait(
              icon: Icons.schedule,
              label: '30 min',
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);
    });
  });
}
