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

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals.where(
      (meal) => meal.categories.contains(category.id),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filteredMeals.toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (ctx, child) => SlideTransition(
        position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
            .animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
        child: child,
      ),
    );
  }
}
