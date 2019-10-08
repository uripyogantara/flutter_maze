import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fazz_game/page/maze/data.dart';

abstract class MazeEvent extends Equatable {
  MazeEvent([List props = const []]) : super(props);
}
class InitEvent extends MazeEvent{}
class BackwardEvent extends MazeEvent{}
class DownwardEvent extends MazeEvent{}
class ForwardEvent extends MazeEvent{}
class UpwardEvent extends MazeEvent{}

// Perbaiki
