class PieceType {
  final String notation;
  final String name;
  const PieceType._internal(this.notation, this.name);

  static const PieceType king = PieceType._internal('k', 'King');
  static const PieceType queen = PieceType._internal('q', 'Queen');
  static const PieceType rook = PieceType._internal('r', 'Rook');
  static const PieceType bishop = PieceType._internal('b', 'Bishop');
  static const PieceType knight = PieceType._internal('n', 'Knight');
  static const PieceType pawn = PieceType._internal('p', 'Pawn');

  static const notationMap = {
    'k': king,
    'q': queen,
    'r': rook,
    'b': bishop,
    'n': knight,
    'p': pawn,
  };

  static PieceType? fromNotation(String symbol) =>
      notationMap[symbol.toLowerCase()];

  @override
  bool operator ==(Object other) {
    late String otherNotation;
    if (other is PieceType) {
      otherNotation = other.toLowerCase();
    } else if (other is String) {
      otherNotation = other.toLowerCase();
    } else {
      return false;
    }
    return otherNotation == notation;
  }

  @override
  int get hashCode => notation.codeUnitAt(0);

  @override
  String toString() => name;
  String toLowerCase() => notation;
  String toUpperCase() => notation.toUpperCase();
}

enum Side { white, black }

class Piece {
  final PieceType type;
  final Side color;
  final String symbol;
  const Piece._(this.type, this.color, this.symbol);

  String get notation =>
      color == Side.white ? type.toUpperCase() : type.toLowerCase();

  @override
  String toString() => symbol;

  static const whiteKing = Piece._(PieceType.king, Side.white, '\u2654');
  static const blackKing = Piece._(PieceType.king, Side.black, '\u265A');
  static const whiteQueen = Piece._(PieceType.queen, Side.white, '\u2655');
  static const blackQueen = Piece._(PieceType.queen, Side.black, '\u265B');
  static const whiteRook = Piece._(PieceType.rook, Side.white, '\u2656');
  static const blackRook = Piece._(PieceType.rook, Side.black, '\u265C');
  static const whiteBishop = Piece._(PieceType.bishop, Side.white, '\u2657');
  static const blackBishop = Piece._(PieceType.bishop, Side.black, '\u265D');
  static const whiteKnight = Piece._(PieceType.knight, Side.white, '\u2658');
  static const blackKnight = Piece._(PieceType.knight, Side.black, '\u265E');
  static const whitePawn = Piece._(PieceType.pawn, Side.white, '\u2659');
  static const blackPawn = Piece._(PieceType.pawn, Side.black, '\u265F');

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
