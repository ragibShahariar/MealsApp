import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/meal.dart';

class FavoriteMealsProviderNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsProviderNotifier() : super([]);

  bool toggleMealFavoriteStatus(meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsProviderNotifier, List<Meal>>((ref) => 
  FavoriteMealsProviderNotifier());