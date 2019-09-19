import 'package:flutter/material.dart';
import 'package:fazz_game/page/maze/maze.dart';

class Dashboard extends StatefulWidget {
  static const PATH = "/";

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List game = [
    [Maze.TAG, Maze.PATH],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(game.length + 1, (index) {
              if (index == 0) {
                return Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      'Fazz Game',
                      style: TextStyle(
                        fontSize: 48,
                      ),
                    ),
                  ),
                );
              }
              return FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(game[index - 1][1]);
                },
                child: Text(game[index - 1][0]),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
