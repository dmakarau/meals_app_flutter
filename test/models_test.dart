import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meals.dart';

void main() {
  group('Category model', () {
    test('creates Category with required fields', () {
      const category = Category(
        id: 'c1',
        title: 'Italian',
      );

      expect(category.id, 'c1');
      expect(category.title, 'Italian');
      expect(category.color, Colors.orange); // default color
    });

    test('creates Category with custom color', () {
      const category = Category(
        id: 'c2',
        title: 'Asian',
        color: Colors.blue,
      );

      expect(category.id, 'c2');
      expect(category.title, 'Asian');
      expect(category.color, Colors.blue);
    });
  });

  group('Meal model', () {
    test('creates Meal with all required fields', () {
      const meal = Meal(
        id: 'm1',
        categories: ['c1', 'c2'],
        title: 'Spaghetti',
        imageUrl: 'https://example.com/image.jpg',
        ingredients: ['pasta', 'tomato'],
        steps: ['boil water', 'cook pasta'],
        duration: 30,
        complexity: Complexity.simple,
        affordability: Affordability.affordable,
        isGlutenFree: false,
        isLactoseFree: true,
        isVegan: false,
        isVegetarian: true,
      );

      expect(meal.id, 'm1');
      expect(meal.categories, ['c1', 'c2']);
      expect(meal.title, 'Spaghetti');
      expect(meal.imageUrl, 'https://example.com/image.jpg');
      expect(meal.ingredients, ['pasta', 'tomato']);
      expect(meal.steps, ['boil water', 'cook pasta']);
      expect(meal.duration, 30);
      expect(meal.complexity, Complexity.simple);
      expect(meal.affordability, Affordability.affordable);
      expect(meal.isGlutenFree, false);
      expect(meal.isLactoseFree, true);
      expect(meal.isVegan, false);
      expect(meal.isVegetarian, true);
    });

    test('Complexity enum has correct values', () {
      expect(Complexity.values.length, 3);
      expect(Complexity.simple.name, 'simple');
      expect(Complexity.challenging.name, 'challenging');
      expect(Complexity.hard.name, 'hard');
    });

    test('Affordability enum has correct values', () {
      expect(Affordability.values.length, 3);
      expect(Affordability.affordable.name, 'affordable');
      expect(Affordability.pricey.name, 'pricey');
      expect(Affordability.luxurious.name, 'luxurious');
    });
  });
}
