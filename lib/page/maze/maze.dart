import 'dart:math';

import 'package:fazz_game/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fazz_game/page/maze/bloc/maze_bloc.dart';
import 'package:fazz_game/page/maze/bloc/maze_event.dart';
import 'package:fazz_game/page/maze/bloc/maze_state.dart';
import 'package:fazz_game/page/maze/maze_view.dart';
import 'package:fazz_game/page/maze/data.dart';

class Maze extends StatefulWidget {
  static const PATH = '/maze';
  static const TAG = 'Maze Game';

  @override
  _MazeState createState() => _MazeState();
}

class _MazeState extends State<Maze> {
  double canvasSize = 0;
  MazeBloc mazeBloc;

  @override
  void initState() {
    super.initState();
    mazeBloc = MazeBloc();
    // TODO: Jalankan Game maze

    WidgetsBinding.instance.addPostFrameCallback((_) => onPostFrame());
  }

  onPostFrame() {
    setState(() {
      canvasSize = min(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height) -
          64;
    });
  }

  @override
  void dispose() {
    mazeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fazz Maze'),
        backgroundColor: colorPrimary,
      ),
      body: BlocListener(
        bloc: mazeBloc,
        listener: (BuildContext context, MazeState state) {
          // TODO: Tampilkan error atau warning ketika user ingin berpindah ke arah yg di blokade
        },
        child: BlocBuilder(
          bloc: mazeBloc,
          builder: (BuildContext context, MazeState state) {
            //TODO: Perbaiki data yg dilempar

            return MazeView(
              canvasSize: canvasSize,
              currentIndexPosition: -1,
              finishIndexPosition: -1,
              numberOfStep: -1,
              isFinished: false,
              isRunning: false,
              isInitial: false,
            );
          },
        ),
      ),
    );
  }
}
