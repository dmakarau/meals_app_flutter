import 'package:flutter/material.dart';
import 'package:meals/widgets/filterswitch_tile.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeSet = false;
  var _lactoseFreeSet = false;
  var _vegetarianSet = false;
  var _veganSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
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
    );
  }
}
