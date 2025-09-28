import 'package:flutter/material.dart';
import 'package:meals/widgets/filterswitch_tile.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map<Filter, bool> _getCurrentFilters() {
    return {
      Filter.glutenFree: _glutenFreeSet,
      Filter.lactoseFree: _lactoseFreeSet,
      Filter.vegetarian: _vegetarianSet,
      Filter.vegan: _veganSet,
    };
  }
  var _glutenFreeSet = false;
  var _lactoseFreeSet = false;
  var _vegetarianSet = false;
  var _veganSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeSet = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeSet = widget.currentFilter[Filter.lactoseFree]!;
    _vegetarianSet = widget.currentFilter[Filter.vegetarian]!;
    _veganSet = widget.currentFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) async {
          if (didPop) return;
          Navigator.of(context).pop(_getCurrentFilters());
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
