import 'package:flutter/material.dart';
import 'package:meals/Widgets/main_drawer.dart';

class FilteredScreen extends StatefulWidget {
  final Map<String, bool> currentFilters;
  final Function saveFilters;
  FilteredScreen(this.currentFilters ,this.saveFilters);

  @override
  _FilteredScreenState createState() => _FilteredScreenState(this.saveFilters);
}

class _FilteredScreenState extends State<FilteredScreen> {

   final Function saveFilters;
  _FilteredScreenState(this.saveFilters);

  bool glutenFree = false;
  bool vegetarianFree = false;
  bool veganFree = false;
  bool lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.currentFilters['gluten'];
    vegetarianFree = widget.currentFilters['vegetarian'];
    veganFree = widget.currentFilters['vegan'];
    lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),

            onPressed: () {
              final selectedfilters = {
                'gluten': glutenFree,
                'vegetarian': vegetarianFree,
                'vegan': veganFree,
                'lactose': lactoseFree
              };
              saveFilters(selectedfilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.headline1),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    'Gluten Free', 'Only Gluten free meal availale', glutenFree,
                    (newValue) {
                  setState(() {
                    glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian Meals',
                    'Only Vegetarian free meal availale',
                    vegetarianFree, (newValue) {
                  setState(() {
                    vegetarianFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan Free', 'Only Vegan free meal availale', veganFree,
                    (newValue) {
                  setState(() {
                    veganFree = newValue;
                  });
                }),
                _buildSwitchListTile('Lactose Free',
                    'Only Lactose free meal availale', lactoseFree, (newValue) {
                  setState(() {
                    lactoseFree = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue);
  }
}
