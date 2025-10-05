import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/widgets/filterswitch_tile.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});
  
  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeSet = false;
  var _lactoseFreeSet = false;
  var _vegetarianSet = false;
  var _veganSet = false;

  Map<Filter, bool> _getCurrentFilters() {
    return {
      Filter.glutenFree: _glutenFreeSet,
      Filter.lactoseFree: _lactoseFreeSet,
      Filter.vegetarian: _vegetarianSet,
      Filter.vegan: _veganSet,
    };
  }

  @override
  void initState() {
    super.initState();
    final activeFilters =ref.read(filterProvider);
    _glutenFreeSet = activeFilters[Filter.glutenFree]!;
    _lactoseFreeSet = activeFilters[Filter.lactoseFree]!;
    _vegetarianSet = activeFilters[Filter.vegetarian]!;
    _veganSet = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: PopScope(
        // Allow the route to be popped by the system/back button.
        canPop: true,
        onPopInvokedWithResult: (bool didPop, Object? result) async {
          // Update provider state; let the pop happen naturally.
          ref.read(filterProvider.notifier).setFilters(_getCurrentFilters());
        },
        child: Column(
          children: [
            FilterSwitchTile(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
              value: _glutenFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeSet = isChecked;
                });
              },
            ),
            FilterSwitchTile(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
              value: _lactoseFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeSet = isChecked;
                });
              },
            ),
            FilterSwitchTile(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
              value: _vegetarianSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianSet = isChecked;
                });
              },
            ),
            FilterSwitchTile(
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
              value: _veganSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganSet = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
