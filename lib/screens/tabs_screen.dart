// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '/models/meal.dart';
import '/widgets/main_drawer.dart';
import '/screens/favourites_screen.dart';
import '/screens/category_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map> _screens;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _screens = [
      {'screen': CategoryScreen(), 'title': 'Categories'},
      {
        'screen': FavouritesScreen(widget.favouriteMeals),
        'title': 'Your Favourites'
      },
    ];
    super.initState();
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // when we want tab at top of the screen, we use DefaultTabController widget which is stateless widget.
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Meals'),
    //       bottom: const TabBar(
    //         labelColor: Colors.red,
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(
    //               CupertinoIcons.heart_fill,
    //             ),
    //             text: 'Favourites',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: const TabBarView(
    //       children: [
    //         CategoryScreen(),
    //         FavouritesScreen(),
    //       ],
    //     ),
    //   ),
    // );

    // If we want to add Tab at bottom of the screen we use Scaffold widget.
    // For this we need a statefull widget.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedIndex]['title'],
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.category,
              size: 27,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(
              CupertinoIcons.heart_fill,
              size: 27,
            ),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
