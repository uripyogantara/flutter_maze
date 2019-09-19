import 'package:fazz_game/page/maze/maze.dart';
import 'package:fazz_game/page/dashboard.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  String initialRoute;
  Routes({@required initialRoute}) : assert(initialRoute != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fazz Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initialRoute,
      routes: <String, WidgetBuilder>{
        Dashboard.PATH: (_) => Dashboard(),
        Maze.PATH: (_) => Maze(),
      },
    );
  }
}
