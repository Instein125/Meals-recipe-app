// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget BuildListTile(IconData icon, String title, VoidCallback tapHandler) {
    // TapHandler is void funtion so we have to use Voidcallback instead of function.
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 23,
          fontFamily: 'RobotoCondensed',
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: const Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 40,
                fontFamily: 'Raleway',
                color: Color.fromARGB(255, 199, 2, 84),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          BuildListTile(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.of(context).pushReplacementNamed('/');
              //pushNamed creates a stack of screen. This decreases performace.
              //Instead we can use pushReplacement so that when we are on new screen, previous screen is deleted.
            },
          ),
          Divider(),
          BuildListTile(
            Icons.settings,
            'Filters',
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
