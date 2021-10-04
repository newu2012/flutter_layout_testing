import 'package:flutter/material.dart';
import 'package:test_test_test_test/BusinessCard/Presentation/business_card_widget.dart';
import 'package:test_test_test_test/Camp/Presentation/camp_widget.dart';
import 'package:test_test_test_test/StateBoxes/Presentation/box_state_parent_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const apps = [
    App('Camp', CampWidget()),
    App('Business Card', BusinessCardWidget()),
    App('Box State', BoxStateParentWidget()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        //  Choose your app there by selecting app by it's title
        app: apps.firstWhere((element) => element.appTitle == 'Box State'),
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
      body: Center(
        child: widget.app.appWidget,
      ),
    );
  }
}
