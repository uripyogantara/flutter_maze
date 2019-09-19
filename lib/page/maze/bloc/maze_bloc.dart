import 'package:bloc/bloc.dart';
import 'package:fazz_game/page/maze/bloc/maze_event.dart';
import 'package:fazz_game/page/maze/bloc/maze_state.dart';
import 'package:fazz_game/page/maze/data.dart';

class MazeBloc extends Bloc<MazeEvent, MazeState> {
  @override
  MazeState get initialState => null;

  @override
  Stream<MazeState> mapEventToState(MazeEvent event) async* {
    // Perbaiki
  }
}
