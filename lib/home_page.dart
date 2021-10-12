import 'package:flutter/material.dart';
import 'Fooderlich/Presentation/fooderlich_widget.dart';

import 'app.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.app,
  }) : super(key: key);

  final App app;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (widget.app.appTitle == 'Fooderlich') {
      return const FooderlichWidget();
    }

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
