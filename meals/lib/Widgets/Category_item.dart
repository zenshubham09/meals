import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/Screen/CategoryMealsScreen.dart';
import 'package:meals/Utilities/Route/RouteConstants.dart';

class CategoryItem extends StatelessWidget {
  /// Variables
  final String id;
  final String title;
  final Color color;

  /// Constructor
  CategoryItem(this.id, this.title, this.color);

  /// User Defined Methods
  void selectCategory(BuildContext context) {
    /*     Navigator.of(context).push(
           Platform.isIOS
          ? CupertinoPageRoute(builder: (_) {
              return CategoryMealsScreen(id, title);
            })
          : MaterialPageRoute(builder: (_) {
              return CategoryMealsScreen(id, title);
            }),
    );
    */

//    Navigator.of(context)
//        .pushNamed('/category-meal', arguments: {'id': id, 'title': title});

    Navigator.of(context).pushNamed(RouteConstants.categoryMeals,
        arguments: CategoryItem(this.id, this.title, this.color));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
