import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Fooderlich/fooderlich_theme.dart';

import 'BusinessCard/Presentation/business_card_widget.dart';
import 'Camp/Presentation/camp_widget.dart';
import 'Fooderlich/fooderlich_widget.dart';
import 'Fooderlich/models/grocery_manager.dart';
import 'StateBoxes/Presentation/box_state_parent_widget.dart';
import 'Recipes/Presentation/recipe_widget.dart';
import 'app.dart';
import 'home_page.dart';
import 'tab_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const apps = {
    App('Camp', CampWidget()),
    App('Business Card', BusinessCardWidget()),
    App('Box State', BoxStateParentWidget()),
    App('Recipe Calculator', RecipeWidget()),
    App('Fooderlich', FooderlichWidget()),
  };

  @override
  Widget build(BuildContext context) {
    late final app =
        apps.firstWhere((element) => element.appTitle == 'Fooderlich');
    final theme = app.appTitle == 'Fooderlich'
        ? FooderlichTheme.dark()
        : ThemeData(
            primarySwatch: Colors.blue,
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: Colors.blue,
                  secondary: Colors.black,
                ),
          );

    return MaterialApp(
      title: '${app.appTitle} Demo',
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: HomePage(
          //  Choose your app there by selecting app by it's title
          app: app,
        ),
      ),
    );
  }
}
