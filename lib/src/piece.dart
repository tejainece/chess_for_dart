import 'package:chess_for_dart/src/game.dart';
import 'package:chess_for_dart/src/piece_type.dart';
import 'package:chess_for_dart/src/square.dart';

export 'package:chess_for_dart/src/piece_type.dart';

abstract class Piece {
  PieceType get type;
  Side get color;
  String get symbol;

  const Piece();

  String get notation =>
      color == Side.white ? type.toUpperCase() : type.toLowerCase();

  List<Move> findMoves(Board board, Square departure) =>
      type.findMoves(board, departure, color);

  @override
  String toString() => symbol;

  static const notationMap = {
    'K': whiteKing,
    'k': blackKing,
    'Q': whiteQueen,
    'q': blackQueen,
    'R': whiteRook,
    'r': blackRook,
    'B': whiteBishop,
    'b': blackBishop,
    'N': whiteKnight,
    'n': blackKnight,
    'P': whitePawn,
    'p': blackPawn,
  };
}

abstract class WhitePiece implements Piece {
  @override
  Side get color => Side.white;
}

abstract class BlackPiece implements Piece {
  @override
  Side get color => Side.black;
}

const whiteKing = WhiteKing._();
const blackKing = BlackKing._();
const whiteQueen = WhiteQueen._();
const blackQueen = BlackQueen._();
const whiteRook = WhiteRook._();
const blackRook = BlackRook._();
const whiteBishop = WhiteBishop._();
const blackBishop = BlackBishop._();
const whiteKnight = WhiteKnight._();
const blackKnight = BlackKnight._();
const whitePawn = WhitePawn._();
const blackPawn = BlackPawn._();

class WhiteKing extends Piece with WhitePiece {
  @override
  final type = PieceType.king;
  @override
  final symbol = '♔';

  const WhiteKing._();

  factory WhiteKing() => whiteKing;
}

class BlackKing extends Piece with BlackPiece {
  @override
  final type = PieceType.king;
  @override
  final symbol = '♚';

  const BlackKing._();

  factory BlackKing() => blackKing;
}

class WhiteQueen extends Piece with WhitePiece {
  @override
  final type = PieceType.queen;
  @override
  final symbol = '♕';

  const WhiteQueen._();

  factory WhiteQueen() => whiteQueen;
}

class BlackQueen extends Piece with BlackPiece {
  @override
  final type = PieceType.queen;
  @override
  final symbol = '♛';

  const BlackQueen._();

  factory BlackQueen() => blackQueen;
}

class WhiteRook extends Piece with WhitePiece {
  @override
  final type = PieceType.rook;
  @override
  final symbol = '♖';

  const WhiteRook._();

  factory WhiteRook() => whiteRook;
}

class BlackRook extends Piece with BlackPiece {
  @override
  final type = PieceType.rook;
  @override
  final symbol = '♜';

  const BlackRook._();

  factory BlackRook() => blackRook;
}

class WhiteBishop extends Piece with WhitePiece {
  @override
  final type = PieceType.bishop;
  @override
  final symbol = '♗';

  const WhiteBishop._();

  factory WhiteBishop() => whiteBishop;
}

class BlackBishop extends Piece with BlackPiece {
  @override
  final type = PieceType.bishop;
  @override
  final symbol = '♝';

  const BlackBishop._();

  factory BlackBishop() => blackBishop;
}

class WhiteKnight extends Piece with WhitePiece {
  @override
  final type = PieceType.knight;
  @override
  final symbol = '♘';

  const WhiteKnight._();

  factory WhiteKnight() => whiteKnight;
}

class BlackKnight extends Piece with BlackPiece {
  @override
  final type = PieceType.knight;
  @override
  final symbol = '♞';

  const BlackKnight._();

  factory BlackKnight() => blackKnight;
}

class WhitePawn extends Piece with WhitePiece {
  @override
  final type = PieceType.pawn;
  @override
  final symbol = '♙';

  const WhitePawn._();

  factory WhitePawn() => whitePawn;
}

class BlackPawn extends Piece with BlackPiece {
  @override
  final type = PieceType.pawn;
  @override
  final symbol = '♟';

  const BlackPawn._();

  factory BlackPawn() => blackPawn;
}
