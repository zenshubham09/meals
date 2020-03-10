import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/Widgets/Category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meals')),
      body: SafeArea(
        child: Container(
          child: GridView(
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: DUMMY_CATEGORIES
                .map((item) => CategoryItem(item.id, item.title, item.color))
                .toList(),
          ),
        ),
      ),
    );
  }
}
