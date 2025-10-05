import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/providers/meals_provider.dart';

void main() {
  group('FiltersNotifier', () {
    test('filterProvider default values are false', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final filters = container.read(filterProvider);

      expect(filters[Filter.glutenFree], isFalse);
      expect(filters[Filter.lactoseFree], isFalse);
      expect(filters[Filter.vegetarian], isFalse);
      expect(filters[Filter.vegan], isFalse);
    });

    test('setFilter updates a single filter', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.glutenFree, true);

      final filters = container.read(filterProvider);
      expect(filters[Filter.glutenFree], isTrue);
      expect(filters[Filter.lactoseFree], isFalse);
      expect(filters[Filter.vegetarian], isFalse);
      expect(filters[Filter.vegan], isFalse);
    });

    test('setFilters replaces all filters', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      final newFilters = {
        Filter.glutenFree: true,
        Filter.lactoseFree: true,
        Filter.vegetarian: false,
        Filter.vegan: true,
      };

      notifier.setFilters(newFilters);

      final filters = container.read(filterProvider);
      expect(filters, equals(newFilters));
    });

    test('setting the same filter value multiple times works correctly', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);

      notifier.setFilter(Filter.glutenFree, true);
      notifier.setFilter(Filter.glutenFree, true);
      notifier.setFilter(Filter.glutenFree, true);

      final filters = container.read(filterProvider);
      expect(filters[Filter.glutenFree], isTrue);
    });

    test('toggling filters on and off updates state correctly', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);

      notifier.setFilter(Filter.vegan, true);
      expect(container.read(filterProvider)[Filter.vegan], isTrue);

      notifier.setFilter(Filter.vegan, false);
      expect(container.read(filterProvider)[Filter.vegan], isFalse);

      notifier.setFilter(Filter.vegan, true);
      expect(container.read(filterProvider)[Filter.vegan], isTrue);
    });

    test('multiple setFilter calls maintain other filter values', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);

      notifier.setFilter(Filter.glutenFree, true);
      notifier.setFilter(Filter.vegan, true);

      final filters = container.read(filterProvider);
      expect(filters[Filter.glutenFree], isTrue);
      expect(filters[Filter.vegan], isTrue);
      expect(filters[Filter.lactoseFree], isFalse);
      expect(filters[Filter.vegetarian], isFalse);
    });
  });

  group('filteredMealsProvider', () {
    test('returns all meals when no filters are active', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final filteredMeals = container.read(filteredMealsProvider);
      final allMeals = container.read(mealsProvider);

      expect(filteredMeals.length, equals(allMeals.length));
      expect(filteredMeals, equals(allMeals));
    });

    test('filters out non-gluten-free meals when glutenFree filter is true', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.glutenFree, true);

      final filteredMeals = container.read(filteredMealsProvider);

      expect(filteredMeals.every((meal) => meal.isGlutenFree), isTrue);
      expect(filteredMeals.length, lessThan(container.read(mealsProvider).length));
    });

    test('filters out non-lactose-free meals when lactoseFree filter is true', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.lactoseFree, true);

      final filteredMeals = container.read(filteredMealsProvider);

      expect(filteredMeals.every((meal) => meal.isLactoseFree), isTrue);
      expect(filteredMeals.length, lessThan(container.read(mealsProvider).length));
    });

    test('filters out non-vegetarian meals when vegetarian filter is true', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.vegetarian, true);

      final filteredMeals = container.read(filteredMealsProvider);

      expect(filteredMeals.every((meal) => meal.isVegetarian), isTrue);
      expect(filteredMeals.length, lessThan(container.read(mealsProvider).length));
    });

    test('filters out non-vegan meals when vegan filter is true', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.vegan, true);

      final filteredMeals = container.read(filteredMealsProvider);

      expect(filteredMeals.every((meal) => meal.isVegan), isTrue);
      expect(filteredMeals.length, lessThan(container.read(mealsProvider).length));
    });

    test('correctly applies multiple filters simultaneously', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.vegan, true);
      notifier.setFilter(Filter.glutenFree, true);

      final filteredMeals = container.read(filteredMealsProvider);

      expect(filteredMeals.every((meal) => meal.isVegan && meal.isGlutenFree), isTrue);
    });

    test('returns empty list when no meals match all active filters', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      // Apply all filters - very unlikely any meal matches all criteria
      notifier.setFilters({
        Filter.glutenFree: true,
        Filter.lactoseFree: true,
        Filter.vegetarian: true,
        Filter.vegan: true,
      });

      final filteredMeals = container.read(filteredMealsProvider);
      final allMeals = container.read(mealsProvider);

      // Check if result matches expected based on data
      final expectedMeals = allMeals.where((meal) =>
        meal.isGlutenFree &&
        meal.isLactoseFree &&
        meal.isVegetarian &&
        meal.isVegan
      ).toList();

      expect(filteredMeals, equals(expectedMeals));
    });

    test('filteredMealsProvider reactively updates when filters change', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final initialFiltered = container.read(filteredMealsProvider);
      final allMeals = container.read(mealsProvider);

      expect(initialFiltered.length, equals(allMeals.length));

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.vegan, true);

      final updatedFiltered = container.read(filteredMealsProvider);

      expect(updatedFiltered.length, lessThan(initialFiltered.length));
      expect(updatedFiltered.every((meal) => meal.isVegan), isTrue);
    });
  });
}
