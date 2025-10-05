import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/models/meals.dart';

void main() {
  test('toggleMealFavoriteStatus treats meals with same id as equal', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final notifier = container.read(favoritesProvider.notifier);

    const meal1 = Meal(
      id: 'mX',
      categories: ['c1'],
      title: 'Meal One',
      imageUrl: '',
      ingredients: [],
      steps: [],
      duration: 5,
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      isGlutenFree: false,
      isLactoseFree: false,
      isVegan: false,
      isVegetarian: false,
    );

    // Different instance but same id
    const meal2 = Meal(
      id: 'mX',
      categories: ['c1'],
      title: 'Meal Two',
      imageUrl: '',
      ingredients: [],
      steps: [],
      duration: 5,
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      isGlutenFree: false,
      isLactoseFree: false,
      isVegan: false,
      isVegetarian: false,
    );

    // Add meal1
    final added = notifier.toggleMealFavoriteStatus(meal1);
    expect(added, isTrue);
    expect(container.read(favoritesProvider).any((m) => m.id == 'mX'), isTrue);

    // Toggle with a different instance sharing same id -> should remove
    final removed = notifier.toggleMealFavoriteStatus(meal2);
    expect(removed, isFalse);
    expect(container.read(favoritesProvider).any((m) => m.id == 'mX'), isFalse);
  });
}
