import 'package:fazz_game/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:fazz_game/page/maze/data.dart';

class MazeView extends StatelessWidget {
  // Tambahkan parameter yang diperlukan untuk menampilkan view" dibawah
  // Gunakan bloc state untuk mendapatkan/merubah value yang ada
  final int currentIndexPosition;
  final finishIndexPosition;
  final double canvasSize;
  final int numberOfStep;
  final bool isInitial;
  final bool isRunning;
  final bool isFinished;

  MazeView({
    @required this.finishIndexPosition,
    @required this.currentIndexPosition,
    @required this.canvasSize,
    @required this.numberOfStep,
    this.isInitial = false,
    this.isFinished = false,
    this.isRunning = false,
  });

  @override
  Widget build(BuildContext context) {
    /* 
    ----- TODO: Gunakan BLOC State untuk menampilkan view dengan ketentuan

    - Disaat halaman baru terbuka, Tampilkan mazegameloadingview
    - Disaat game berjalan, tampilkan MazeGameArenaView
    - Disaat game berakhir, tampilkan MazeGameFinishedView

    Lengkapi semua fungsi dan data yg ada

    */
  }
}

class MazeGameLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 60,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class MazeGameFinishedView extends StatelessWidget {
  int step;
  VoidCallback
      onTryAgain; //TODO: Buat fungsi untuk mengulangi game ketika ditekan
  MazeGameFinishedView({this.step, this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text('Number of step: $step'),
            SizedBox(height: 16.0),
            FlatButton(
              child: Text('Try Again?'),
              onPressed: onTryAgain,
            ),
          ],
        ),
      ),
    );
  }
}

class MazeGameArenaView extends StatelessWidget {
  double canvasSize = 0;
  int currentPosition;
  int finishPosition;
  VoidCallback
      onBackward; //TODO: Buat fungsi untuk memindahkan posisi player kesamping kiri, manfaatkan bloc dispatch untuk perubahan
  VoidCallback
      onForward; //TODO: Buat fungsi untuk memindahkan posisi player kesamping kanan, manfaatkan bloc dispatch untuk perubahan
  VoidCallback
      onUpward; //TODO: Buat fungsi untuk memindahkan posisi player kesamping atas, manfaatkan bloc dispatch untuk perubahan
  VoidCallback
      onDownward; //TODO: Buat fungsi untuk memindahkan posisi player kesamping bawah, manfaatkan bloc dispatch untuk perubahan

  MazeGameArenaView({
    @required this.canvasSize,
    @required this.currentPosition,
    @required this.finishPosition,
    @required this.onBackward,
    @required this.onForward,
    @required this.onUpward,
    @required this.onDownward,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Maze Playground
        Container(
          padding: const EdgeInsets.all(32.0).copyWith(top: 56.0),
          child: Table(
            children: List.generate(
              sliceNumber,
              (indexCol) => TableRow(
                children: List.generate(sliceNumber, (indexRow) {
                  int currentIndex = (indexCol * sliceNumber) + indexRow;
                  return MazeBlockView(
                    areaSize: canvasSize / sliceNumber,
                    isCurrentPosition: currentIndex == currentPosition,
                    isFinishPlace: currentIndex == finishPosition,
                    blockedDirection: blockedDirections[currentIndex],
                  );
                }).toList(),
              ),
            ),
          ),
        ),

        //Controller red dot
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                height: 64.0,
                child: Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                ),
                color: colorPrimary,
                onPressed: onBackward,
              ),
              MaterialButton(
                height: 64.0,
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                color: colorPrimary,
                onPressed: onForward,
              ),
              MaterialButton(
                height: 64.0,
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
                color: colorPrimary,
                onPressed: onUpward,
              ),
              MaterialButton(
                height: 64.0,
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
                color: colorPrimary,
                onPressed: onDownward,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MazeBlockView extends StatelessWidget {
  double areaSize;
  bool isCurrentPosition;
  bool isFinishPlace;
  List<Direction> blockedDirection;

  MazeBlockView({
    this.isCurrentPosition = false,
    this.isFinishPlace = false,
    @required this.areaSize,
    @required this.blockedDirection,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(areaSize, areaSize),
      painter: MazeBlock(
          areaSize: areaSize,
          isCurrentPosition: isCurrentPosition,
          blockedDirection: blockedDirection,
          isFinishPlace: isFinishPlace),
    );
  }
}

class MazeBlock extends CustomPainter {
  double areaSize;
  bool isCurrentPosition;
  bool isFinishPlace;
  List<Direction> blockedDirection;

  MazeBlock({
    @required this.areaSize,
    @required this.isCurrentPosition,
    @required this.blockedDirection,
    @required this.isFinishPlace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    /* 
    ---- TODO: DRAW MAZE BLOCK AREA
    
    Diketahui terdapat area berukuran 'areaSize',
    Buatlah sebuah area berbentuk persegi dengan ukuran areaSize x areaSize.
    Jika area ini adalah area tempat player berada, gambarkan lingkaran bulat berwarna merah ditengah area dengan radius 1/10 dari panjang area.
    Jika area ini adalah area finish, warnai latar area dengan warna oranye
    
    Untuk setiap blockedDirection, gambarkan Garis hitam penghalang jalan
    cth: 
    arah kiri dan bawah diblokir, maka tampilan area
    
    |     
    |     
    |_____

    
    Jika anda merasa soal ini tidak berguna bagi anda, DM untuk minta jawaban

    */
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
