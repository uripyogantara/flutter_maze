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
    mazeBloc.dispatch(InitEvent());
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

            // if (state is MazeGameArena) {
            //   return MazeView(
            //     canvasSize: canvasSize,
            //     currentIndexPosition: state.currentIndexPosition,
            //     finishIndexPosition: 4,
            //     numberOfStep: 0,
            //     isFinished: false,
            //     isRunning: false,
            //     isInitial: false,
            //     onBackward: _onBackward,
            //     onForward: _onForward,
            //     onDownward: _onDownward,
            //     onUpward: _onUpward,
            //   );  
            // }

            return MazeView(
                canvasSize: canvasSize,
                currentIndexPosition: 20,
                finishIndexPosition: 4,
                numberOfStep: 0,
                isFinished: false,
                isRunning: false,
                isInitial: false,
                onBackward: _onBackward,
                onForward: _onForward,
                onDownward: _onDownward,
                onUpward: _onUpward,
              );  
            
            
            //TODO: Perbaiki data yg dilempar

            
          },
        ),
      ),
    );
  }

  _onBackward(){
    print("backward");
    mazeBloc.dispatch(BackwardEvent());
  }

  _onForward(){
    print("forward");
    mazeBloc.dispatch(ForwardEvent());
  }
  _onDownward(){
    print("downward");
    mazeBloc.dispatch(DownwardEvent());
  }
  _onUpward(){
    print("upward");
    mazeBloc.dispatch(UpwardEvent());
  }
}
