import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/data/mock_data.dart';

void main() {
  test('mealsProvider returns mockedMeals', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final meals = container.read(mealsProvider);

    // Basic sanity checks
    expect(meals, isNotNull);
    expect(meals, same(mockedMeals));
    expect(meals.length, mockedMeals.length);

    // Check at least one field from the first meal if available
    if (meals.isNotEmpty) {
      final first = meals.first;
      expect(first.title, isA<String>());
      expect(first.id, isA<String>());
    }
  });
}
