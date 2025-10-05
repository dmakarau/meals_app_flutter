import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals/widgets/filterswitch_tile.dart';

void main() {
  group('FilterSwitchTile widget', () {
    testWidgets('displays title and subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterSwitchTile(
              title: 'Gluten-Free',
              subtitle: 'Only include gluten-free meals',
              value: false,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('Gluten-Free'), findsOneWidget);
      expect(find.text('Only include gluten-free meals'), findsOneWidget);
    });

    testWidgets('displays switch with correct initial value', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterSwitchTile(
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              value: true,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      final switchWidget = tester.widget<SwitchListTile>(find.byType(SwitchListTile));
      expect(switchWidget.value, isTrue);
    });

    testWidgets('calls onChanged when switch is toggled', (WidgetTester tester) async {
      bool? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterSwitchTile(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              value: false,
              onChanged: (value) {
                changedValue = value;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SwitchListTile));
      expect(changedValue, isTrue);
    });

    testWidgets('switch starts as false and can be toggled', (WidgetTester tester) async {
      bool currentValue = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return FilterSwitchTile(
                  title: 'Lactose-Free',
                  subtitle: 'Only include lactose-free meals',
                  value: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                );
              },
            ),
          ),
        ),
      );

      // Initially false
      SwitchListTile switchWidget = tester.widget<SwitchListTile>(find.byType(SwitchListTile));
      expect(switchWidget.value, isFalse);

      // Tap to toggle
      await tester.tap(find.byType(SwitchListTile));
      await tester.pump();

      // Now true
      switchWidget = tester.widget<SwitchListTile>(find.byType(SwitchListTile));
      expect(switchWidget.value, isTrue);
    });

    testWidgets('has correct content padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterSwitchTile(
              title: 'Test',
              subtitle: 'Test subtitle',
              value: false,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      final switchWidget = tester.widget<SwitchListTile>(find.byType(SwitchListTile));
      expect(switchWidget.contentPadding, const EdgeInsets.only(left: 34, right: 22));
    });

    testWidgets('is wrapped in SwitchListTile', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterSwitchTile(
              title: 'Test',
              subtitle: 'Test subtitle',
              value: false,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(SwitchListTile), findsOneWidget);
    });
  });
}
