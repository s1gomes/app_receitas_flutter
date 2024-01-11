import 'package:flutter/material.dart';
import 'package:proj_receitas_udemy/components/meal_item.dart';
import 'package:proj_receitas_udemy/models/meals.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.favoriteMeals});
  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(child: Text('Nenhuma refeição marcada como favorita.'));
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: favoriteMeals[index]);}
        );
    }
  }
}
