import 'package:flutter/material.dart';
import 'models/dummy_data.dart';
import './pages/filters.dart';
import './pages/meal_detail.dart';
import './pages/tabs_screen.dart';
import './pages/category_meals.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "vegtarian": false,
    "lactose": false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree ||
            _filters["vegtarian"] && !meal.isVeg ||
            _filters["lactose"] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFav(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  void _toggleFavourite(String mealId) {
    final index = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    setState(() {
      if (index >= 0) {
        _favouriteMeals.removeAt(index);
      } else {
        final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
        _favouriteMeals.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaah Recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        TabsScreen.routeName: (context) => TabsScreen(_favouriteMeals),
        CategoryMealPage.routeName: (context) =>
            CategoryMealPage(_availableMeals),
        MealDetail.routeName: (context) =>
            MealDetail(_toggleFavourite, _isMealFav),
        FliterPage.routeName: (context) => FliterPage(_setFilter, _filters),
      },
    );
  }
}
