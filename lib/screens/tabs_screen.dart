import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }

  void toogleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);  
      });
      showInfoMessage('Meal removed from favorites.');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      showInfoMessage('Meal added to favorites.');
    }
  }

  void selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeTab = CategoriesScreen(onToogleFavorite: toogleMealFavoriteStatus);
    String activeTabTitle = 'Categories';

    if (_selectedTabIndex == 1) {
      activeTab = MealsScreen(
        meals: _favoriteMeals,
        onToogleFavorite: toogleMealFavoriteStatus,
      );
      activeTabTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeTabTitle)),
      body: activeTab,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
