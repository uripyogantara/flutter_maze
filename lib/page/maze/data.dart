enum Direction { Left, Right, Top, Bottom }

final int sliceNumber = 5;

final List<List<Direction>> blockedDirections = [
  [Direction.Left, Direction.Top],
  [Direction.Top, Direction.Bottom],
  [Direction.Top, Direction.Bottom],
  [Direction.Top, Direction.Bottom],
  [Direction.Right, Direction.Top, Direction.Bottom],
  [Direction.Left, Direction.Right],
  [Direction.Left, Direction.Top, Direction.Bottom],
  [Direction.Top],
  [Direction.Top, Direction.Bottom],
  [Direction.Right, Direction.Top],
  [Direction.Left, Direction.Bottom],
  [Direction.Top, Direction.Bottom],
  [Direction.Bottom],
  [Direction.Right, Direction.Top, Direction.Bottom],
  [Direction.Left, Direction.Right],
  [Direction.Left, Direction.Top],
  [Direction.Top],
  [Direction.Top, Direction.Bottom],
  [Direction.Right, Direction.Top, Direction.Bottom],
  [Direction.Left, Direction.Right],
  [Direction.Left, Direction.Right, Direction.Bottom],
  [Direction.Left, Direction.Bottom],
  [Direction.Top, Direction.Bottom],
  [Direction.Top, Direction.Bottom],
  [Direction.Right, Direction.Bottom],
];
