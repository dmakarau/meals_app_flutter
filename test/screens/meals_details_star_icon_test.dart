import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/providers/favorites_provider.dart';

void main() {
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

  group('MealsDetailsScreen Star Icon Logic', () {
    test('meal is not in favorites initially', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final favorites = container.read(favoritesProvider);

      expect(favorites.contains(testMeal), isFalse);
    });

    test('adding meal to favorites makes contains return true', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(favoritesProvider.notifier);
      notifier.toggleMealFavoriteStatus(testMeal);

      final favorites = container.read(favoritesProvider);

      expect(favorites.contains(testMeal), isTrue);
    });

    test('removing meal from favorites makes contains return false', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(favoritesProvider.notifier);

      // Add then remove
      notifier.toggleMealFavoriteStatus(testMeal);
      notifier.toggleMealFavoriteStatus(testMeal);

      final favorites = container.read(favoritesProvider);

      expect(favorites.contains(testMeal), isFalse);
    });

    test('star icon should be Icons.star_border when not favorited', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final isFavorite = container.read(favoritesProvider).contains(testMeal);
      final expectedIcon = isFavorite ? Icons.star : Icons.star_border;

      expect(expectedIcon, Icons.star_border);
    });

    test('star icon should be Icons.star when favorited', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(favoritesProvider.notifier);
      notifier.toggleMealFavoriteStatus(testMeal);

      final isFavorite = container.read(favoritesProvider).contains(testMeal);
      final expectedIcon = isFavorite ? Icons.star : Icons.star_border;

      expect(expectedIcon, Icons.star);
    });

    test('toggling favorite status multiple times alternates star icon', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(favoritesProvider.notifier);

      // Initially not favorited
      var isFavorite = container.read(favoritesProvider).contains(testMeal);
      expect(isFavorite ? Icons.star : Icons.star_border, Icons.star_border);

      // After first toggle - favorited
      notifier.toggleMealFavoriteStatus(testMeal);
      isFavorite = container.read(favoritesProvider).contains(testMeal);
      expect(isFavorite ? Icons.star : Icons.star_border, Icons.star);

      // After second toggle - not favorited
      notifier.toggleMealFavoriteStatus(testMeal);
      isFavorite = container.read(favoritesProvider).contains(testMeal);
      expect(isFavorite ? Icons.star : Icons.star_border, Icons.star_border);

      // After third toggle - favorited again
      notifier.toggleMealFavoriteStatus(testMeal);
      isFavorite = container.read(favoritesProvider).contains(testMeal);
      expect(isFavorite ? Icons.star : Icons.star_border, Icons.star);
    });
  });
}
