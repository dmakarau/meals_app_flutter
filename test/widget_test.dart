// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals/main.dart';

void main() {
  setUpAll(() {
    // Prevent google_fonts from trying to fetch fonts over the network during tests.
    // Some google_fonts versions expose a config setter; if not, assigning a new
    // config object may be required. This line is the simplest common form.
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('App starts and displays tab screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that the app bar title displays Categories
    expect(find.widgetWithText(AppBar, 'Categories'), findsOneWidget);

    // Verify that bottom navigation bar is present
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
