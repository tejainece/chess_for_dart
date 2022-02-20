enum Side { white, black }

abstract class PieceType {
  String get name;
  String get notation;

  @override
  String toString() => name;
  String toLowerCase() => notation;
  String toUpperCase() => notation.toUpperCase();

  static const king = King._();
  static const queen = Queen._();
  static const rook = Rook._();
  static const bishop = Bishop._();
  static const knight = Knight._();
  static const pawn = Pawn._();

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
}

class King with PieceType {
  @override
  final name = 'King';
  @override
  final notation = 'k';

  const King._();

  factory King() => PieceType.king;


}

class Queen with PieceType {
  @override
  final name = 'Queen';
  @override
  final notation = 'q';

  const Queen._();

  factory Queen() => PieceType.queen;
}

class Rook with PieceType {
  @override
  final name = 'Rook';
  @override
  final notation = 'r';

  const Rook._();

  factory Rook() => PieceType.rook;
}

class Bishop with PieceType {
  @override
  final name = 'Bishop';
  @override
  final notation = 'b';

  const Bishop._();

  factory Bishop() => PieceType.bishop;
}

class Knight with PieceType {
  @override
  final name = 'Knight';
  @override
  final notation = 'n';

  const Knight._();

  factory Knight() => PieceType.knight;
}

class Pawn with PieceType {
  @override
  final name = 'Pawn';
  @override
  final notation = 'p';

  const Pawn._();

  factory Pawn() => PieceType.pawn;
}
