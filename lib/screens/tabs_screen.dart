import 'package:flutter/material.dart';
import 'package:proj_receitas_udemy/components/drawer.dart';
import 'package:proj_receitas_udemy/models/meals.dart';
import 'package:proj_receitas_udemy/screens/categories_screen.dart';
import 'package:proj_receitas_udemy/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key, required this.favoriteMeals});
  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;
  late List<Map<String, dynamic>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
       {'title': 'Lista de categorias', 'screen': CategoriesScreen()},
    {'title': 'Meus favoritos', 'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals)}
    ];
  }


  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['screen'].toString()),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
           BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categorias'
            ),
           BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: 'Favoritos'
            )
        ],
      ),
    );
  }
}