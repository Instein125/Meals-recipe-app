import 'package:flutter/material.dart';

import '/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filtersscreen';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _lactoseFree = false;
  var _vegeterian = false;

  Widget _buildSwitchListTile(
      String title, String subtitle, var currentValue, updateValue) {
    return SwitchListTile(
      activeColor: Color.fromARGB(255, 12, 131, 16),
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Filter what you need!!',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten free',
                    'Only includes meal without gluten',
                    _glutenFree, (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Lactose free',
                    'Only includes meal without lactose',
                    _lactoseFree, (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only includes meal that is vegan', _vegan,
                    (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Vegeterain',
                    'Only includes meal that is vegeterian',
                    _vegeterian, (newValue) {
                  setState(
                    () {
                      _vegeterian = newValue;
                    },
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
