import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'category.dart';
import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/";
  final List<Meal> favouriteMeals;
  const TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      CategoryPage(),
      FavouriteScreen(
        widget.favouriteMeals,
      ),
    ];
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vaah Recipe"),
      ),
      drawer: MainDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            title: const Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            title: const Text("Favourite"),
          ),
        ],
      ),
    );
  }
}
