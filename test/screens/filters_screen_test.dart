import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';

void main() {
  group('FiltersScreen Logic', () {
    test('all filters start as false', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final filters = container.read(filterProvider);

      expect(filters[Filter.glutenFree], isFalse);
      expect(filters[Filter.lactoseFree], isFalse);
      expect(filters[Filter.vegetarian], isFalse);
      expect(filters[Filter.vegan], isFalse);
    });

    test('setting glutenFree filter updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.glutenFree, true);

      final filters = container.read(filterProvider);
      expect(filters[Filter.glutenFree], isTrue);
    });

    test('setting lactoseFree filter updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.lactoseFree, true);

      final filters = container.read(filterProvider);
      expect(filters[Filter.lactoseFree], isTrue);
    });

    test('setting vegetarian filter updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.vegetarian, true);

      final filters = container.read(filterProvider);
      expect(filters[Filter.vegetarian], isTrue);
    });

    test('setting vegan filter updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.vegan, true);

      final filters = container.read(filterProvider);
      expect(filters[Filter.vegan], isTrue);
    });

    test('multiple filters can be set independently', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.glutenFree, true);
      notifier.setFilter(Filter.vegan, true);

      final filters = container.read(filterProvider);
      expect(filters[Filter.glutenFree], isTrue);
      expect(filters[Filter.lactoseFree], isFalse);
      expect(filters[Filter.vegetarian], isFalse);
      expect(filters[Filter.vegan], isTrue);
    });

    test('filters can be toggled on and off', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);

      // Turn on
      notifier.setFilter(Filter.glutenFree, true);
      expect(container.read(filterProvider)[Filter.glutenFree], isTrue);

      // Turn off
      notifier.setFilter(Filter.glutenFree, false);
      expect(container.read(filterProvider)[Filter.glutenFree], isFalse);
    });

    test('all filters can be enabled at once', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(filterProvider.notifier);
      notifier.setFilter(Filter.glutenFree, true);
      notifier.setFilter(Filter.lactoseFree, true);
      notifier.setFilter(Filter.vegetarian, true);
      notifier.setFilter(Filter.vegan, true);

      final filters = container.read(filterProvider);
      expect(filters[Filter.glutenFree], isTrue);
      expect(filters[Filter.lactoseFree], isTrue);
      expect(filters[Filter.vegetarian], isTrue);
      expect(filters[Filter.vegan], isTrue);
    });
  });
}
