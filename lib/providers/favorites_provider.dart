import 'package:flutter_riverpod/legacy.dart';
import 'package:meals/models/meals.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isFavorite = state.any((m) => m.id == meal.id);
    if (isFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }

    state = [...state, meal];
    return true;
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
      return FavoritesMealsNotifier();
    });
