import 'package:flutter/material.dart';
import 'package:meals/Screen/favourites_screen.dart';
import 'catagories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.category), text: 'Categories',),
            Tab(icon: Icon(Icons.star), text: 'Favourite',)
          ],
        ),
      ),
      body: TabBarView(children: <Widget>[
        CategoriesScreen(),
        FavouritesScreen()
      ],),
    ));
  }
}
