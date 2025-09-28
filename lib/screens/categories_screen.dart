import 'package:flutter/material.dart';
import 'package:meals/data/mock_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_grid_item.dart';

// Grid configuration constants
const int kGridCrossAxisCount = 2;
const double kGridChildAspectRatio = 3 / 2;
const double kGridCrossAxisSpacing = 20.0;
const double kGridMainAxisSpacing = 20.0;
const double kGridPadding = 24.0;

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToogleFavorite, required this.availableMeals});

  final void Function(Meal meal) onToogleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals.where(
      (meal) => meal.categories.contains(category.id),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals.toList(),
          onToogleFavorite: onToogleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(kGridPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: kGridCrossAxisCount,
        childAspectRatio: kGridChildAspectRatio,
        crossAxisSpacing: kGridCrossAxisSpacing,
        mainAxisSpacing: kGridMainAxisSpacing,
      ),
      children: [
        ...extraCategories.map(
          (category) => CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
        ),
      ],
    );
  }
}
