import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meals.dart';

class FavoritesMealsNotifier extends Notifier<List<Meal>> {
  @override
  List<Meal> build() {
    return [];
  }

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

final favoritesProvider = NotifierProvider<FavoritesMealsNotifier, List<Meal>>(
  () => FavoritesMealsNotifier(),
);
