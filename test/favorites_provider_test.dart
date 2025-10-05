import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/models/meals.dart';

void main() {
  test('toggleMealFavoriteStatus adds and removes meal', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final notifier = container.read(favoritesProvider.notifier);

    const meal = Meal(
      id: 'm1',
      categories: ['c1'],
      title: 'Test Meal',
      imageUrl: 'http://example.com',
      ingredients: ['i1'],
      steps: ['s1'],
      duration: 10,
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      isGlutenFree: false,
      isLactoseFree: false,
      isVegan: false,
      isVegetarian: false,
    );

    // Initially not favorite
    expect(container.read(favoritesProvider), isEmpty);

    // Add to favorites
    final added = notifier.toggleMealFavoriteStatus(meal);
    expect(added, isTrue);
    expect(container.read(favoritesProvider), contains(meal));

    // Remove from favorites
    final removed = notifier.toggleMealFavoriteStatus(meal);
    expect(removed, isFalse);
    expect(container.read(favoritesProvider), isNot(contains(meal)));
  });
}
