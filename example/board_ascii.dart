import 'package:chess_for_dart/chess_for_dart.dart';

main() {
  final board = Board();
  print(board.ascii());
  board.move(Move(
      turn: Side.white,
      piece: PieceType.knight,
      departure: Square.b1,
      destination: Square.c3,
      capture: false));
  print(board.ascii());
}
