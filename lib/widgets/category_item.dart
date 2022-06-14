// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';

import '../screens/specific_category_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imageUrl;

  void selectCategory(BuildContext cxt) {
    // Navigator.of(cxt).push(MaterialPageRoute(builder: (_) {
    //   return SpecificCategoryScreen(id, title);
    // }));
    Navigator.of(cxt).pushNamed(
      SpecificCategoryScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  Widget BuildFrostedGlass(double width, double height, Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: width + 40,
        height: height + 10,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
              ),
              child: Container(
                child: child,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Colors.black.withOpacity(0.5),
                //     Colors.transparent.withOpacity(0.2),
                //   ],
                //   stops: const [0, 1],
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: use_key_in_widget_constructors
  const CategoryItem(this.id, this.title, this.color, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        // padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     color.withOpacity(0.5),
          //     color,
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          image: DecorationImage(
            image: Image.network(imageUrl).image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: BuildFrostedGlass(
          size.width,
          size.height,
          Center(
            child: Stack(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
