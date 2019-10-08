import 'package:bloc/bloc.dart';
import 'package:fazz_game/page/maze/bloc/maze_event.dart';
import 'package:fazz_game/page/maze/bloc/maze_state.dart';
import 'package:fazz_game/page/maze/data.dart';

class MazeBloc extends Bloc<MazeEvent, MazeState> {

  int currentIndexPosition= 20;
  @override
  MazeState get initialState => null;

  @override
  Stream<MazeState> mapEventToState(MazeEvent event) async* {
    if(event is InitEvent){
      yield MazeGameArena(currentIndexPosition);
    }else if (event is UpwardEvent) {
      currentIndexPosition-=5;
      yield MazeGameArena(currentIndexPosition);
    }else if (event is DownwardEvent) {
      currentIndexPosition+=5;
      yield MazeGameArena(currentIndexPosition);
    }else if (event is BackwardEvent) {
      currentIndexPosition-=1;
      yield MazeGameArena(currentIndexPosition);
    }else if (event is ForwardEvent) {
      currentIndexPosition+=1;
      yield MazeGameArena(currentIndexPosition);
    }
    // Perbaiki
  }
}
