import 'package:chess_for_dart/chess_for_dart.dart';

enum Side { white, black }

abstract class PieceType {
  String get name;
  String get notation;

  @override
  String toString() => name;
  String toLowerCase() => notation;
  String toUpperCase() => notation.toUpperCase();

  List<Move> findMoves(Board board, Square departure, Side color);

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

  @override
  List<Move> findMoves(Board board, Square departure, Side color) {
    // TODO
    throw UnimplementedError();
  }
}

class Queen with PieceType {
  @override
  final name = 'Queen';
  @override
  final notation = 'q';

  const Queen._();

  factory Queen() => PieceType.queen;

  @override
  List<Move> findMoves(Board board, Square departure, Side color) {
    final ret = <Move>[];

    // TODO if king is under check, only moves that prevent all checks are legal moves

    outer:
    for (final dir in Direction.adjacents) {
      for (Square? tracker = departure + dir;
          tracker != null;
          tracker = tracker + dir) {
        final piece = board[tracker];

        if (piece == null) {
          ret.add(Move(
              turn: color,
              piece: this,
              departure: departure,
              destination: tracker,
              capture: false));
          continue;
        }

        if (piece.color == color) {
          continue outer;
        } else if (piece.type == PieceType.king) {
          continue outer;
        }

        ret.add(Move(
            turn: color,
            piece: this,
            departure: departure,
            destination: tracker,
            capture: true));
        continue outer;
      }
    }

    outer:
    for (final dir in Direction.diagonals) {
      for (Square? tracker = departure + dir;
          tracker != null;
          tracker = tracker + dir) {
        final piece = board[tracker];

        if (piece == null) {
          ret.add(Move(
              turn: color,
              piece: this,
              departure: departure,
              destination: tracker,
              capture: false));
          continue;
        }

        if (piece.color == color) {
          continue outer;
        } else if (piece.type == PieceType.king) {
          continue outer;
        }

        ret.add(Move(
            turn: color,
            piece: this,
            departure: departure,
            destination: tracker,
            capture: true));
        continue outer;
      }
    }

    return ret;
  }
}

class Rook with PieceType {
  @override
  final name = 'Rook';
  @override
  final notation = 'r';

  const Rook._();

  factory Rook() => PieceType.rook;

  @override
  List<Move> findMoves(Board board, Square departure, Side color) {
    final ret = <Move>[];

    // TODO if king is under check, only moves that prevent all checks are legal moves

    outer:
    for (final dir in Direction.adjacents) {
      for (Square? tracker = departure + dir;
          tracker != null;
          tracker = tracker + dir) {
        final piece = board[tracker];

        if (piece == null) {
          ret.add(Move(
              turn: color,
              piece: this,
              departure: departure,
              destination: tracker,
              capture: false));
          continue;
        }

        if (piece.color == color) {
          continue outer;
        } else if (piece.type == PieceType.king) {
          continue outer;
        }

        ret.add(Move(
            turn: color,
            piece: this,
            departure: departure,
            destination: tracker,
            capture: true));
        continue outer;
      }
    }

    return ret;
  }
}

class Bishop with PieceType {
  @override
  final name = 'Bishop';
  @override
  final notation = 'b';

  const Bishop._();

  factory Bishop() => PieceType.bishop;

  @override
  List<Move> findMoves(Board board, Square departure, Side color) {
    final ret = <Move>[];

    // TODO if king is under check, only moves that prevent all checks are legal moves

    outer:
    for (final dir in Direction.diagonals) {
      for (Square? tracker = departure + dir;
          tracker != null;
          tracker = tracker + dir) {
        final piece = board[tracker];

        if (piece == null) {
          ret.add(Move(
              turn: color,
              piece: this,
              departure: departure,
              destination: tracker,
              capture: false));
          continue;
        }

        if (piece.color == color) {
          continue outer;
        } else if (piece.type == PieceType.king) {
          continue outer;
        }

        ret.add(Move(
            turn: color,
            piece: this,
            departure: departure,
            destination: tracker,
            capture: true));
        continue outer;
      }
    }

    return ret;
  }
}

class Knight with PieceType {
  @override
  final name = 'Knight';
  @override
  final notation = 'n';

  const Knight._();

  factory Knight() => PieceType.knight;

  @override
  List<Move> findMoves(Board board, Square departure, Side color) {
    final ret = <Move>[];

    // TODO if king is under check, only moves that prevent all checks are legal moves

    for (final dir in Direction.knight) {
      final Square? tracker = departure + dir;
      if (tracker == null) {
        continue;
      }

      final piece = board[tracker];

      if (piece == null) {
        ret.add(Move(
            turn: color,
            piece: this,
            departure: departure,
            destination: tracker,
            capture: false));
        continue;
      }

      if (piece.color == color) {
        continue;
      } else if (piece.type == PieceType.king) {
        continue;
      }

      ret.add(Move(
          turn: color,
          piece: this,
          departure: departure,
          destination: tracker,
          capture: true));
    }

    return ret;
  }
}

class Pawn with PieceType {
  @override
  final name = 'Pawn';
  @override
  final notation = 'p';

  const Pawn._();

  factory Pawn() => PieceType.pawn;

  List<Move> findMovesWhite(Board board, Square departure) {
    final ret = <Move>[];

    // TODO if king is under check, only moves that prevent all checks are legal moves

    throw UnimplementedError();
  }

  List<Move> findMovesBlack(Board board, Square departure) {
    final ret = <Move>[];

    // TODO if king is under check, only moves that prevent all checks are legal moves

    throw UnimplementedError();
  }

  @override
  List<Move> findMoves(Board board, Square departure, Side color) {
    if (color == Side.white) {
      return findMovesWhite(board, departure);
    } else {
      return findMovesBlack(board, departure);
    }
  }
}
