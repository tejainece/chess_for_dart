import 'package:chess_for_dart/chess_for_dart.dart';

main() {
  final move = Move(
      turn: Side.white,
      piece: PieceType.knight,
      departure: Square.b1,
      destination: Square.c3,
      capture: false);
  print(move.notation());
}
