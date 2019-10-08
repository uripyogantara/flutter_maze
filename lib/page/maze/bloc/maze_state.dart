import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MazeState extends Equatable {
  MazeState([List props = const []]) : super(props);
}

class MazeGameLoading extends MazeState{
}
class MazeGameArena extends MazeState{

  final int currentIndexPosition;
  MazeGameArena(this.currentIndexPosition);
}
class MazeGameFinished extends MazeState{}
// Perbaiki
