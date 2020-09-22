import 'package:flutter/material.dart';
import 'package:vaah_recipe/pages/filters.dart';
import 'package:vaah_recipe/pages/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.fastfood,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Vaah Recipe",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text("Meals"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.filter_list),
            title: Text("Filter"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(FliterPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
