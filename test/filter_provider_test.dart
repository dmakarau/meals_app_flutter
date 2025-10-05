import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';

void main() {
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
}
