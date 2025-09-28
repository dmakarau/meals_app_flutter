import 'package:flutter/material.dart';
import 'package:meals/data/mock_data.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  List<Meal> _availableMeals = [];

  List<Meal> _filterMeals(Map<Filter, bool> filters) {
    return mockedMeals.where((meal) {
      if (filters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (filters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (filters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }
  int _selectedTabIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;
  @override
  void initState() {
    super.initState();
    _availableMeals = _filterMeals(_selectedFilters);
  }

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: const Duration(seconds: 2), content: Text(message)),
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

  void _selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (context) => FiltersScreen(currentFilter: _selectedFilters)),
      );
      setState(() {
        _selectedFilters = Map<Filter, bool>.from(result ?? kInitialFilters);
        _availableMeals = _filterMeals(_selectedFilters);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeTab = CategoriesScreen(
      onToogleFavorite: toogleMealFavoriteStatus,
      availableMeals: _availableMeals,
    );
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
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activeTab,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _selectPage,
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
