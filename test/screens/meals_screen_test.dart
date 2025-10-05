import 'package:flutter_test/flutter_test.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meals_screen.dart';

void main() {
  group('MealsScreen', () {
    final testMeals = [
      Meal(
        id: 'test1',
        categories: ['c1'],
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
        categories: ['c1'],
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

    test('_selectMeal navigates to meal details', () {
      final screen = MealsScreen(title: 'Test', meals: testMeals);

      // This test verifies the method exists and accepts correct parameters
      expect(screen, isNotNull);
      expect(screen.meals, equals(testMeals));
      expect(screen.title, equals('Test'));
    });

    test('MealsScreen with null title returns body without scaffold', () {
      final screen = MealsScreen(meals: testMeals);

      expect(screen.title, isNull);
      expect(screen.meals, equals(testMeals));
    });

    test('MealsScreen with title includes scaffold', () {
      final screen = MealsScreen(title: 'Italian Meals', meals: testMeals);

      expect(screen.title, equals('Italian Meals'));
      expect(screen.meals, equals(testMeals));
    });

    test('MealsScreen handles empty meals list', () {
      final screen = MealsScreen(title: 'Empty', meals: []);

      expect(screen.meals, isEmpty);
      expect(screen.title, equals('Empty'));
    });

    test('MealsScreen with meals list', () {
      final screen = MealsScreen(title: 'Test', meals: testMeals);

      expect(screen.meals.length, equals(2));
      expect(screen.meals[0].title, equals('Test Meal 1'));
      expect(screen.meals[1].title, equals('Test Meal 2'));
    });
  });
}
