import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meals_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.onToogleFavorite});

   void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsDetailsScreen(meal: meal, onToogleFavorite: onToogleFavorite),
      ),
    );
  }

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToogleFavorite;

  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(meal: meals[index], onSelectMeal: (context, meal) {
        _selectMeal(context, meal);
      }),
    );
    if (meals.isEmpty) {
      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meals found!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category.',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return body;
    }
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: body,
    );
  }
}
