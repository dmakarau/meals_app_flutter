import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals/widgets/main_drawer.dart';

void main() {
  group('MainDrawer widget', () {
    testWidgets('displays drawer header with title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: MainDrawer(
                onSelectScreen: (identifier) {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Cooking Up!'), findsOneWidget);
      expect(find.byType(DrawerHeader), findsOneWidget);
    });

    testWidgets('displays fastfood icon in header', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: MainDrawer(
                onSelectScreen: (identifier) {},
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.fastfood), findsOneWidget);
    });

    testWidgets('displays Meals menu item', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: MainDrawer(
                onSelectScreen: (identifier) {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Meals'), findsOneWidget);
      expect(find.byIcon(Icons.restaurant), findsOneWidget);
    });

    testWidgets('displays Filters menu item', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: MainDrawer(
                onSelectScreen: (identifier) {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Filters'), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('calls onSelectScreen with "meals" when Meals is tapped', (WidgetTester tester) async {
      String? selectedScreen;

      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: MainDrawer(
                onSelectScreen: (identifier) {
                  selectedScreen = identifier;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Meals'));
      expect(selectedScreen, 'meals');
    });

    testWidgets('calls onSelectScreen with "filters" when Filters is tapped', (WidgetTester tester) async {
      String? selectedScreen;

      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: MainDrawer(
                onSelectScreen: (identifier) {
                  selectedScreen = identifier;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Filters'));
      expect(selectedScreen, 'filters');
    });

    testWidgets('has two ListTile widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: MainDrawer(
                onSelectScreen: (identifier) {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(ListTile), findsNWidgets(2));
    });

    testWidgets('drawer header has gradient decoration', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: MainDrawer(
                onSelectScreen: (identifier) {},
              ),
            ),
          ),
        ),
      );

      final drawerHeader = tester.widget<DrawerHeader>(find.byType(DrawerHeader));
      expect(drawerHeader.decoration, isA<BoxDecoration>());
      final decoration = drawerHeader.decoration as BoxDecoration;
      expect(decoration.gradient, isA<LinearGradient>());
    });
  });
}
