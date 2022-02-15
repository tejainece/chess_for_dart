class PieceType {
  final String symbol;
  final String name;
  const PieceType._internal(this.symbol, this.name);

  static const PieceType king = PieceType._internal('k', 'King');
  static const PieceType queen = PieceType._internal('q', 'Queen');
  static const PieceType rook = PieceType._internal('r', 'Rook');
  static const PieceType bishop = PieceType._internal('b', 'Bishop');
  static const PieceType knight = PieceType._internal('n', 'Knight');
  static const PieceType pawn = PieceType._internal('p', 'Pawn');

  static const symbolMap = {
    'k': king,
    'q': queen,
    'r': rook,
    'b': bishop,
    'n': knight,
    'p': pawn,
  };

  static PieceType? fromSymbol(String symbol) =>
      symbolMap[symbol.toLowerCase()];

  @override
  bool operator ==(Object other) {
    late String otherSymbol;
    if (other is PieceType) {
      otherSymbol = other.toLowerCase();
    } else if (other is String) {
      otherSymbol = other.toLowerCase();
    } else {
      return false;
    }
    return otherSymbol == symbol;
  }

  @override
  int get hashCode => symbol.codeUnitAt(0);

  @override
  String toString() => name;
  String toLowerCase() => symbol;
  String toUpperCase() => symbol.toUpperCase();
}

enum Color { white, black }

class Piece {
  final PieceType type;
  final Color color;
  const Piece._(this.type, this.color);

  String get symbol =>
      color == Color.white ? type.toUpperCase() : type.toLowerCase();

  static const whiteKing = Piece._(PieceType.king, Color.white);
  static const blackKing = Piece._(PieceType.king, Color.black);
  static const whiteQueen = Piece._(PieceType.queen, Color.white);
  static const blackQueen = Piece._(PieceType.queen, Color.black);
  static const whiteRook = Piece._(PieceType.rook, Color.white);
  static const blackRook = Piece._(PieceType.rook, Color.black);
  static const whiteBishop = Piece._(PieceType.bishop, Color.white);
  static const blackBishop = Piece._(PieceType.bishop, Color.black);
  static const whiteKnight = Piece._(PieceType.knight, Color.white);
  static const blackKnight = Piece._(PieceType.knight, Color.black);
  static const whitePawn = Piece._(PieceType.pawn, Color.white);
  static const blackPawn = Piece._(PieceType.pawn, Color.black);

  static const symbolMap = {
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
