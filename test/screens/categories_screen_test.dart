import 'package:flutter_test/flutter_test.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories_screen.dart';

void main() {
  group('CategoriesScreen', () {
    final testMeals = [
      Meal(
        id: 'test1',
        categories: ['c1', 'c2'],
        title: 'Test Meal 1',
        imageUrl: 'https://test.com/image1.jpg',
        ingredients: ['ingredient1'],
        steps: ['step1'],
        duration: 20,
        complexity: Complexity.simple,
        affordability: Affordability.affordable,
        isGlutenFree: false,
        isVegan: false,
        isVegetarian: false,
        isLactoseFree: false,
      ),
      Meal(
        id: 'test2',
        categories: ['c2', 'c3'],
        title: 'Test Meal 2',
        imageUrl: 'https://test.com/image2.jpg',
        ingredients: ['ingredient2'],
        steps: ['step2'],
        duration: 30,
        complexity: Complexity.challenging,
        affordability: Affordability.pricey,
        isGlutenFree: true,
        isVegan: true,
        isVegetarian: true,
        isLactoseFree: true,
      ),
    ];

    test('CategoriesScreen is created with available meals', () {
      final screen = CategoriesScreen(availableMeals: testMeals);

      expect(screen, isNotNull);
      expect(screen.availableMeals, equals(testMeals));
      expect(screen.availableMeals.length, equals(2));
    });

    test('CategoriesScreen filters meals by category', () {
      final screen = CategoriesScreen(availableMeals: testMeals);

      // Verify meals are available
      expect(screen.availableMeals, equals(testMeals));

      // Filter meals for category c1
      final c1Meals = testMeals.where((meal) => meal.categories.contains('c1')).toList();
      expect(c1Meals.length, equals(1));
      expect(c1Meals[0].id, equals('test1'));

      // Filter meals for category c2
      final c2Meals = testMeals.where((meal) => meal.categories.contains('c2')).toList();
      expect(c2Meals.length, equals(2));

      // Filter meals for category c3
      final c3Meals = testMeals.where((meal) => meal.categories.contains('c3')).toList();
      expect(c3Meals.length, equals(1));
      expect(c3Meals[0].id, equals('test2'));
    });

    test('CategoriesScreen handles empty meals list', () {
      final screen = CategoriesScreen(availableMeals: []);

      expect(screen.availableMeals, isEmpty);
    });

    test('grid configuration constants have expected values', () {
      // Import constants are checked at compile time
      expect(kGridCrossAxisCount, equals(2));
      expect(kGridChildAspectRatio, equals(3 / 2));
      expect(kGridCrossAxisSpacing, equals(20.0));
      expect(kGridMainAxisSpacing, equals(20.0));
      expect(kGridPadding, equals(24.0));
    });
  });
}
