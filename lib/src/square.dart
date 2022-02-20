import 'dart:math';

import 'package:chess_for_dart/src/piece_type.dart';

class File {
  final String notation;
  const File._(this.notation);

  factory File.parse(String notation) {
    notation = notation.toLowerCase();
    for (final file in files) {
      if (file.notation == notation) {
        return file;
      }
    }

    throw Exception('invalid file notation $notation');
  }

  factory File.byIndex(int index) {
    if (index < 0 || index > 7) {
      throw Exception('invalid file index $index');
    }
    return files[index];
  }

  int get index => notation.codeUnitAt(0) - a.notation.codeUnitAt(0);

  File? operator +(int offset) {
    final resIndex = index + offset;
    if (resIndex < 0 || index > 7) {
      return null;
    }
    return files[index];
  }

  static const a = File._('a');
  static const b = File._('b');
  static const c = File._('c');
  static const d = File._('d');
  static const e = File._('e');
  static const f = File._('f');
  static const g = File._('g');
  static const h = File._('h');

  static const files = [a, b, c, d, e, f, g, h];
}

class Rank {
  final String notation;
  const Rank._(this.notation);

  factory Rank.parse(String notation) {
    notation = notation.toLowerCase();
    for (final rank in ranks) {
      if (rank.notation == notation) {
        return rank;
      }
    }

    throw Exception('invalid rank notation $notation');
  }

  factory Rank.byIndex(int index) {
    if (index < 0 || index > 7) {
      throw Exception('invalid tank index $index');
    }
    return ranks[index];
  }

  Rank? operator +(int offset) {
    final resIndex = index + offset;
    if (resIndex < 0 || index > 7) {
      return null;
    }
    return ranks[index];
  }

  int get index => notation.codeUnitAt(0) - one.notation.codeUnitAt(0);

  static const one = Rank._('1');
  static const two = Rank._('2');
  static const three = Rank._('3');
  static const four = Rank._('4');
  static const five = Rank._('5');
  static const six = Rank._('6');
  static const seven = Rank._('7');
  static const eight = Rank._('8');

  static const ranks = [one, two, three, four, five, six, seven, eight];
}

class Square {
  final File file;
  final Rank rank;
  const Square._(this.file, this.rank);

  factory Square(File file, Rank rank) => squares[rank.index][file.index];

  factory Square.parse(String notation) {
    final parts = notation.split('');
    if (parts.length != 2) {
      throw Exception('invalid square algebraic notation');
    }

    return Square._(File.parse(parts[0]), Rank.parse(parts[1]));
  }

  Square? get n => this + Direction.n;
  Square? get ne => this + Direction.ne;
  Square? get e => this + Direction.e;
  Square? get se => this + Direction.se;
  Square? get s => this + Direction.s;
  Square? get sw => this + Direction.sw;
  Square? get w => this + Direction.w;
  Square? get nw => this + Direction.nw;

  String get notation => '${file.notation}${rank.notation}';

  Square? operator +(Direction direction) {
    final newFile = file + direction.y;
    if (newFile == null) {
      return null;
    }
    final newRank = rank + direction.x;
    if (newRank == null) {
      return null;
    }
    return Square(newFile, newRank);
  }

  static const squares = [
    [a1, b1, c1, d1, e1, f1, g1, h1],
    [a2, b2, c2, d2, e2, f2, g2, h2],
    [a3, b3, c3, d3, e3, f3, g3, h3],
    [a4, b4, c4, d4, e4, f4, g4, h4],
    [a5, b5, c5, d5, e5, f5, g5, h5],
    [a6, b6, c6, d6, e6, f6, g6, h6],
    [a7, b7, c7, d7, e7, f7, g7, h7],
    [a8, b8, c8, d8, e8, f8, g8, h8],
  ];

  static const a1 = Square._(File.a, Rank.one);
  static const a2 = Square._(File.a, Rank.two);
  static const a3 = Square._(File.a, Rank.three);
  static const a4 = Square._(File.a, Rank.four);
  static const a5 = Square._(File.a, Rank.five);
  static const a6 = Square._(File.a, Rank.six);
  static const a7 = Square._(File.a, Rank.seven);
  static const a8 = Square._(File.a, Rank.eight);

  static const b1 = Square._(File.b, Rank.one);
  static const b2 = Square._(File.b, Rank.two);
  static const b3 = Square._(File.b, Rank.three);
  static const b4 = Square._(File.b, Rank.four);
  static const b5 = Square._(File.b, Rank.five);
  static const b6 = Square._(File.b, Rank.six);
  static const b7 = Square._(File.b, Rank.seven);
  static const b8 = Square._(File.b, Rank.eight);

  static const c1 = Square._(File.c, Rank.one);
  static const c2 = Square._(File.c, Rank.two);
  static const c3 = Square._(File.c, Rank.three);
  static const c4 = Square._(File.c, Rank.four);
  static const c5 = Square._(File.c, Rank.five);
  static const c6 = Square._(File.c, Rank.six);
  static const c7 = Square._(File.c, Rank.seven);
  static const c8 = Square._(File.c, Rank.eight);

  static const d1 = Square._(File.d, Rank.one);
  static const d2 = Square._(File.d, Rank.two);
  static const d3 = Square._(File.d, Rank.three);
  static const d4 = Square._(File.d, Rank.four);
  static const d5 = Square._(File.d, Rank.five);
  static const d6 = Square._(File.d, Rank.six);
  static const d7 = Square._(File.d, Rank.seven);
  static const d8 = Square._(File.d, Rank.eight);

  static const e1 = Square._(File.e, Rank.one);
  static const e2 = Square._(File.e, Rank.two);
  static const e3 = Square._(File.e, Rank.three);
  static const e4 = Square._(File.e, Rank.four);
  static const e5 = Square._(File.e, Rank.five);
  static const e6 = Square._(File.e, Rank.six);
  static const e7 = Square._(File.e, Rank.seven);
  static const e8 = Square._(File.e, Rank.eight);

  static const f1 = Square._(File.f, Rank.one);
  static const f2 = Square._(File.f, Rank.two);
  static const f3 = Square._(File.f, Rank.three);
  static const f4 = Square._(File.f, Rank.four);
  static const f5 = Square._(File.f, Rank.five);
  static const f6 = Square._(File.f, Rank.six);
  static const f7 = Square._(File.f, Rank.seven);
  static const f8 = Square._(File.f, Rank.eight);

  static const g1 = Square._(File.g, Rank.one);
  static const g2 = Square._(File.g, Rank.two);
  static const g3 = Square._(File.g, Rank.three);
  static const g4 = Square._(File.g, Rank.four);
  static const g5 = Square._(File.g, Rank.five);
  static const g6 = Square._(File.g, Rank.six);
  static const g7 = Square._(File.g, Rank.seven);
  static const g8 = Square._(File.g, Rank.eight);

  static const h1 = Square._(File.h, Rank.one);
  static const h2 = Square._(File.h, Rank.two);
  static const h3 = Square._(File.h, Rank.three);
  static const h4 = Square._(File.h, Rank.four);
  static const h5 = Square._(File.h, Rank.five);
  static const h6 = Square._(File.h, Rank.six);
  static const h7 = Square._(File.h, Rank.seven);
  static const h8 = Square._(File.h, Rank.eight);
}

class Direction {
  final String name;
  final Point<int> offset;

  const Direction._(this.name, this.offset);

  int get x => offset.x;
  int get y => offset.y;

  static const n = Direction._('n', Point(0, 1));
  static const ne = Direction._('ne', Point(1, 1));
  static const e = Direction._('e', Point(1, 0));
  static const se = Direction._('se', Point(1, -1));
  static const s = Direction._('s', Point(0, -1));
  static const sw = Direction._('sw', Point(-1, -1));
  static const w = Direction._('w', Point(-1, 0));
  static const nw = Direction._('nw', Point(-1, 1));

  static const nne = Direction._('nne', Point(1, 2));
  static const ene = Direction._('ene', Point(2, 1));
  static const ese = Direction._('ese', Point(2, -1));
  static const sse = Direction._('sse', Point(1, -2));
  static const ssw = Direction._('ssw', Point(-1, -2));
  static const wsw = Direction._('wsw', Point(-2, -1));
  static const wnw = Direction._('wnw', Point(-2, 1));
  static const nnw = Direction._('nnw', Point(-1, 2));

  static const diagonals = [ne, se, sw, nw];

  static const adjacents = [n, e, s, w];

  static const knight = [nne, ene, ese, sse, ssw, wsw, wnw, nnw];

  static const whitePawnCaptures = [ne, nw];
  static const blackPawnCaptures = [se, sw];
}

class Move {
  final Side turn;
  final PieceType piece;
  final Square departure;
  final Square destination;
  final bool capture;

  Move(
      {required this.turn,
      required this.piece,
      required this.departure,
      required this.destination,
      required this.capture});

  Square? get enPassant {
    if (piece != PieceType.pawn) {
      return null;
    }
    if (turn == Side.white) {
      if (departure.rank == Rank.two && destination.rank == Rank.four) {
        return departure.n;
      } else {
        return null;
      }
    } else {
      if (departure.rank == Rank.seven && destination.rank == Rank.five) {
        return departure.s;
      } else {
        return null;
      }
    }
  }

  String notation() =>
      '${piece.notation.toUpperCase()}${departure.notation}${capture ? 'x' : ''}${destination.notation}';
}
