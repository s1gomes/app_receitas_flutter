import 'package:flutter/material.dart';
import 'package:proj_receitas_udemy/data/dummy_data.dart';
import 'package:proj_receitas_udemy/models/meals.dart';
import 'package:proj_receitas_udemy/models/settings.dart';
import 'package:proj_receitas_udemy/screens/category_meals_screen.dart';
import 'package:proj_receitas_udemy/screens/meal_detail_screen.dart';
import 'package:proj_receitas_udemy/screens/settings_screen.dart';
import 'package:proj_receitas_udemy/screens/tabs_screen.dart';
import 'package:proj_receitas_udemy/utils/app_routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static MaterialColor green =
      const MaterialColor(_greenPrimaryValue, <int, Color>{
    50: Color(0xFF4CAF50),
    100: Color(0xFF43A047),
    200: Color(0xFF388E3C),
    300: Color(_greenPrimaryValue),
    500: Color(0xFF1B5E20),
    600: Color(0xFF2196F3),
    700: Color(0xFF1E88E5),
    800: Color(0xFF1976D2),
    900: Color(0xFF1565C0),
  });
  static const int _greenPrimaryValue = 0xFF2E7D32;


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];


  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterVegetarian && !filterLactose && !filterVegan && !filterGluten;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
          primarySwatch: MyApp.green,
          fontFamily: 'Raleway',
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: const TextStyle(
                  fontSize: 20, fontFamily: 'RobotoCondensed'))),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAILS: (ctx) => MealDetailScreen(onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(onSettingsChanged: _filterMeals, settings: settings,)
      },
    );
  }
}
