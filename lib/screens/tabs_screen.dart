// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '/screens/favourites_screen.dart';
import '/screens/category_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
            labelColor: Colors.red,
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  CupertinoIcons.heart_fill,
                ),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoryScreen(),
            FavouritesScreen(),
          ],
        ),
      ),
    );
  }
}
