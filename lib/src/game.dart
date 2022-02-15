import 'package:chess_for_dart/src/piece.dart';
import 'package:chess_for_dart/src/square.dart';

class Board {
  final List<List<Piece?>> _board;

  Board._(this._board);

  factory Board.make(List<List<Piece?>> board) {
    if (board.length != 8) {
      throw Exception('invalid number of ranks');
    }
    for (int i = 0; i < 8; i++) {
      if (board[i].length != 8) {
        throw Exception('invalid number of files in rank $i');
      }
    }

    // TODO validate board

    return Board._(board.map((e) => e.toList()).toList());
  }

  Piece? operator [](Square square) =>
      _board[square.rank.index][square.file.index];

  String ascii({bool flip = false}) {
    final sb = StringBuffer();

    final ranks = flip ? Rank.ranks : Rank.ranks.reversed;
    for (final rank in ranks) {
      sb.write(rank.notation);
      for (final file in File.files) {
        final square = Square(file, rank);
        final piece = this[square];
        final symbol = piece?.symbol ?? ' ';
        sb.write(symbol);
      }
      sb.writeln();
    }

    sb.write(' ');
    for (final file in File.files) {
      sb.write(file.notation);
    }
    sb.writeln();
    return sb.toString();
  }
}

class Move {
  final Color turn;
  final PieceType piece;
  final Square position;
  Move(this.turn, this.piece, this.position);
}
