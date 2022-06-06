// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget BuildListTile(IconData icon, String title) {
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
          BuildListTile(Icons.restaurant, 'Meals'),
          Divider(),
          BuildListTile(Icons.settings, 'Filters'),
        ],
      ),
    );
  }
}
