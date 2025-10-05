import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/widgets/filterswitch_tile.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
          children: [
            FilterSwitchTile(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
            ),
            FilterSwitchTile(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
            ),
            FilterSwitchTile(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
            ),
            FilterSwitchTile(
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
            ),
          ],
        ),
    );
}
}
