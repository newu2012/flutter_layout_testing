import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'data/memory_repository.dart';
import 'data/moor/moor_repository.dart';
import 'ui/main_screen.dart';
import 'data/repository.dart';
import 'data/sqlite/sqlite_repository.dart';
import 'network/recipe_service.dart';
import 'network/service_interface.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = MoorRepository();
  await repository.init();

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final Repository repository;
  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _setupLogging();

    return MultiProvider(
      providers: [
        Provider<Repository>(
          create: (_) => repository,
          dispose: (_, Repository repository) => repository.close(),

          lazy: false,
        ),
        Provider<ServiceInterface>(
          create: (_) => RecipeService.create(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Recipes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainScreen(),
      ),
    );
  }

  void _setupLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    });
  }
}
