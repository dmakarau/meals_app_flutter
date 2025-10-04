import 'package:flutter_riverpod/legacy.dart';
import 'package:meals/models/meals.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final isFavorite = state.contains(meal);
    if (isFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
      return FavoritesMealsNotifier();
    });
