import 'package:flutter/material.dart';

import '/screens/tabs_screen.dart';
import '/screens/meal_detail_screen.dart';
import 'screens/category_screen.dart';
import 'screens/specific_category_screen.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
          primaryColor: const Color(0xfff38c10),
          accentColor: const Color(0xff4c482e),
          canvasColor: const Color(0xffccd7d8),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xfff38c10),
          ),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                color: Colors.black,
              ),
              headline2: const TextStyle(
                color: Colors.black,
              ),
              headline5: const TextStyle(
                fontFamily: 'Raleway',
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              headline6: const TextStyle(
                color: Color.fromARGB(255, 70, 35, 5),
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ))),
      // home: CategoryScreen(),
      initialRoute: '/', //   '/' is the default symbol for home
      routes: {
        '/': (ctx) => const TabsScreen(),
        SpecificCategoryScreen.routeName: (cxt) => SpecificCategoryScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const CategoryScreen());
      }, //onGenerateRoute : The route generator callback used when the app is navigated to a named route.
      // ... This is used if routes does not contain the requested route.
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const CategoryScreen());
      }, //onUnknownRoute property is used to handle the worst case when the app navigation fails to get a route.
      //If not handled, exception will be generated.
    );
  }
}
