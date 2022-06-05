import 'package:flutter/material.dart';

import '../screens/specific_category_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

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

  // ignore: use_key_in_widget_constructors
  const CategoryItem(this.id, this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.5),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
