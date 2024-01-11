import 'package:flutter/material.dart';
import 'package:proj_receitas_udemy/components/meal_item.dart';
import 'package:proj_receitas_udemy/data/dummy_data.dart';
import 'package:proj_receitas_udemy/models/category.dart';
import 'package:proj_receitas_udemy/models/meals.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key, required this.meals});
  final List<Meal> meals;


  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
        return MealItem(meal: categoryMeals[index]);
      }),
    );
  }
}