class File {
  final String notation;
  const File._(this.notation);

  factory File.parse(String notation) {
    notation = notation.toLowerCase();
    for(final file in files) {
      if(file.notation == notation) {
        return file;
      }
    }

    throw Exception('invalid file notation $notation');
  }

  int get index => notation.codeUnitAt(0) - a.notation.codeUnitAt(0);

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
    for(final rank in ranks) {
      if(rank.notation == notation) {
        return rank;
      }
    }

    throw Exception('invalid rank notation $notation');
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
  const Square(this.file, this.rank);

  factory Square.parse(String notation) {
    final parts = notation.split('');
    if(parts.length != 2) {
      throw Exception('invalid square algebraic notation');
    }

    return Square(File.parse(parts[0]), Rank.parse(parts[1]));
  }

  String get notation => '${file.notation}${rank.notation}';

  static const a1 = Square(File.a, Rank.one);
  static const a2 = Square(File.a, Rank.two);
  static const a3 = Square(File.a, Rank.three);
  static const a4 = Square(File.a, Rank.four);
  static const a5 = Square(File.a, Rank.five);
  static const a6 = Square(File.a, Rank.six);
  static const a7 = Square(File.a, Rank.seven);
  static const a8 = Square(File.a, Rank.eight);

  static const b1 = Square(File.b, Rank.one);
  static const b2 = Square(File.b, Rank.two);
  static const b3 = Square(File.b, Rank.three);
  static const b4 = Square(File.b, Rank.four);
  static const b5 = Square(File.b, Rank.five);
  static const b6 = Square(File.b, Rank.six);
  static const b7 = Square(File.b, Rank.seven);
  static const b8 = Square(File.b, Rank.eight);

  static const c1 = Square(File.c, Rank.one);
  static const c2 = Square(File.c, Rank.two);
  static const c3 = Square(File.c, Rank.three);
  static const c4 = Square(File.c, Rank.four);
  static const c5 = Square(File.c, Rank.five);
  static const c6 = Square(File.c, Rank.six);
  static const c7 = Square(File.c, Rank.seven);
  static const c8 = Square(File.c, Rank.eight);

  static const d1 = Square(File.d, Rank.one);
  static const d2 = Square(File.d, Rank.two);
  static const d3 = Square(File.d, Rank.three);
  static const d4 = Square(File.d, Rank.four);
  static const d5 = Square(File.d, Rank.five);
  static const d6 = Square(File.d, Rank.six);
  static const d7 = Square(File.d, Rank.seven);
  static const d8 = Square(File.d, Rank.eight);

  static const e1 = Square(File.e, Rank.one);
  static const e2 = Square(File.e, Rank.two);
  static const e3 = Square(File.e, Rank.three);
  static const e4 = Square(File.e, Rank.four);
  static const e5 = Square(File.e, Rank.five);
  static const e6 = Square(File.e, Rank.six);
  static const e7 = Square(File.e, Rank.seven);
  static const e8 = Square(File.e, Rank.eight);

  static const f1 = Square(File.f, Rank.one);
  static const f2 = Square(File.f, Rank.two);
  static const f3 = Square(File.f, Rank.three);
  static const f4 = Square(File.f, Rank.four);
  static const f5 = Square(File.f, Rank.five);
  static const f6 = Square(File.f, Rank.six);
  static const f7 = Square(File.f, Rank.seven);
  static const f8 = Square(File.f, Rank.eight);

  static const g1 = Square(File.g, Rank.one);
  static const g2 = Square(File.g, Rank.two);
  static const g3 = Square(File.g, Rank.three);
  static const g4 = Square(File.g, Rank.four);
  static const g5 = Square(File.g, Rank.five);
  static const g6 = Square(File.g, Rank.six);
  static const g7 = Square(File.g, Rank.seven);
  static const g8 = Square(File.g, Rank.eight);

  static const h1 = Square(File.h, Rank.one);
  static const h2 = Square(File.h, Rank.two);
  static const h3 = Square(File.h, Rank.three);
  static const h4 = Square(File.h, Rank.four);
  static const h5 = Square(File.h, Rank.five);
  static const h6 = Square(File.h, Rank.six);
  static const h7 = Square(File.h, Rank.seven);
  static const h8 = Square(File.h, Rank.eight);

// TODO get diagonals

// TODO get ranks

// TODO get files
}