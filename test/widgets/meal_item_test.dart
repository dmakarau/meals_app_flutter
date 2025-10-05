import 'package:flutter_test/flutter_test.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/meal_item.dart';

void main() {
  group('MealItem', () {
    final testMeal = Meal(
      id: 'test1',
      categories: ['c1'],
      title: 'Test Meal',
      imageUrl: 'https://test.com/image.jpg',
      ingredients: ['ingredient1'],
      steps: ['step1'],
      duration: 20,
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: false,
    );

    test('complexityText capitalizes first letter for simple', () {
      final mealItem = MealItem(meal: testMeal, onSelectMeal: (context, meal) {});

      expect(mealItem.complexityText, equals('Simple'));
    });

    test('complexityText capitalizes first letter for challenging', () {
      final challengingMeal = Meal(
        id: 'test2',
        categories: ['c1'],
        title: 'Challenging Meal',
        imageUrl: 'https://test.com/image.jpg',
        ingredients: ['ingredient1'],
        steps: ['step1'],
        duration: 45,
        complexity: Complexity.challenging,
        affordability: Affordability.pricey,
        isGlutenFree: false,
        isVegan: false,
        isVegetarian: false,
        isLactoseFree: false,
      );

      final mealItem = MealItem(meal: challengingMeal, onSelectMeal: (context, meal) {});

      expect(mealItem.complexityText, equals('Challenging'));
    });

    test('complexityText capitalizes first letter for hard', () {
      final hardMeal = Meal(
        id: 'test3',
        categories: ['c1'],
        title: 'Hard Meal',
        imageUrl: 'https://test.com/image.jpg',
        ingredients: ['ingredient1'],
        steps: ['step1'],
        duration: 60,
        complexity: Complexity.hard,
        affordability: Affordability.luxurious,
        isGlutenFree: false,
        isVegan: false,
        isVegetarian: false,
        isLactoseFree: false,
      );

      final mealItem = MealItem(meal: hardMeal, onSelectMeal: (context, meal) {});

      expect(mealItem.complexityText, equals('Hard'));
    });

    test('affordabilityText capitalizes first letter for affordable', () {
      final mealItem = MealItem(meal: testMeal, onSelectMeal: (context, meal) {});

      expect(mealItem.affordabilityText, equals('Affordable'));
    });

    test('affordabilityText capitalizes first letter for pricey', () {
      final priceyMeal = Meal(
        id: 'test4',
        categories: ['c1'],
        title: 'Pricey Meal',
        imageUrl: 'https://test.com/image.jpg',
        ingredients: ['ingredient1'],
        steps: ['step1'],
        duration: 30,
        complexity: Complexity.simple,
        affordability: Affordability.pricey,
        isGlutenFree: false,
        isVegan: false,
        isVegetarian: false,
        isLactoseFree: false,
      );

      final mealItem = MealItem(meal: priceyMeal, onSelectMeal: (context, meal) {});

      expect(mealItem.affordabilityText, equals('Pricey'));
    });

    test('affordabilityText capitalizes first letter for luxurious', () {
      final luxuriousMeal = Meal(
        id: 'test5',
        categories: ['c1'],
        title: 'Luxurious Meal',
        imageUrl: 'https://test.com/image.jpg',
        ingredients: ['ingredient1'],
        steps: ['step1'],
        duration: 90,
        complexity: Complexity.hard,
        affordability: Affordability.luxurious,
        isGlutenFree: false,
        isVegan: false,
        isVegetarian: false,
        isLactoseFree: false,
      );

      final mealItem = MealItem(meal: luxuriousMeal, onSelectMeal: (context, meal) {});

      expect(mealItem.affordabilityText, equals('Luxurious'));
    });
  });
}
