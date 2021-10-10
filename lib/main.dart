import 'package:flutter/material.dart';

import 'BusinessCard/Presentation/business_card_widget.dart';
import 'Camp/Presentation/camp_widget.dart';
import 'StateBoxes/Presentation/box_state_parent_widget.dart';
import 'Recipes/Presentation/recipe_widget.dart';

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
  };

  @override
  Widget build(BuildContext context) {
    late final app =
        apps.firstWhere((element) => element.appTitle == 'Recipe Calculator');

    return MaterialApp(
      title: '${app.appTitle} Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.blue,
              secondary: Colors.black,
            ),
      ),
      home: MyHomePage(
        //  Choose your app there by selecting app by it's title
        app: app,
      ),
    );
  }
}

class App {
  final String appTitle;
  final Widget appWidget;

  const App(this.appTitle, this.appWidget);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.app,
  }) : super(key: key);

  final App app;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.app.appTitle),
      ),
      body: SafeArea(
        child: Center(
          child: widget.app.appWidget,
        ),
      ),
    );
  }
}
