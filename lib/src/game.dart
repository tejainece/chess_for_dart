import 'package:chess_for_dart/src/fen_parser.dart';

class Board {
  final FEN starting;

  final List<List<Piece?>> _board;

  /// Which side is to move next
  Side _turn;

  bool _canWhiteCastleKingSide;
  bool _canWhiteCastleQueenSide;
  bool _canBlackCastleKingSide;
  bool _canBlackCastleQueenSide;

  Square? _enPassant;
  int _halfMoveClock;
  int _fullMoveClock;
  // TODO repetition

  Board._(
      {required this.starting,
      required List<List<Piece?>> board,
      required Side turn,
      required bool canWhiteCastleKingSide,
      required bool canWhiteCastleQueenSide,
      required bool canBlackCastleKingSide,
      required bool canBlackCastleQueenSide,
      required Square? enPassant,
      required int halfMoveClock,
      required int fullMoveClock})
      : _board = board,
        _turn = turn,
        _canWhiteCastleKingSide = canWhiteCastleKingSide,
        _canWhiteCastleQueenSide = canWhiteCastleQueenSide,
        _canBlackCastleKingSide = canBlackCastleKingSide,
        _canBlackCastleQueenSide = canBlackCastleQueenSide,
        _enPassant = enPassant,
        _halfMoveClock = halfMoveClock,
        _fullMoveClock = fullMoveClock;

  factory Board() => Board.fromFEN(FEN.starting);

  factory Board.fromFEN(FEN fen) {
    return Board._(
        starting: fen,
        board: fen.board.map((e) => e.toList()).toList(),
        turn: fen.turn,
        canWhiteCastleKingSide: fen.canWhiteCastleKingSide,
        canWhiteCastleQueenSide: fen.canWhiteCastleQueenSide,
        canBlackCastleKingSide: fen.canBlackCastleKingSide,
        canBlackCastleQueenSide: fen.canBlackCastleQueenSide,
        enPassant: fen.enPassant,
        halfMoveClock: fen.halfMoveClock,
        fullMoveClock: fen.fullMoveClock);
  }

  Side get turn => _turn;
  bool get canWhiteCastleKingSide => _canWhiteCastleKingSide;
  bool get canWhiteCastleQueenSide => _canWhiteCastleQueenSide;
  bool get canBlackCastleKingSide => _canBlackCastleKingSide;
  bool get canBlackCastleQueenSide => _canBlackCastleQueenSide;
  Square? get enPassant => _enPassant;
  int get halfMoveClock => _halfMoveClock;
  int get fullMoveClock => _fullMoveClock;

  Piece? operator [](Square square) =>
      _board[square.rank.index][square.file.index];

  void operator []=(Square square, Piece? piece) =>
      _board[square.rank.index][square.file.index] = piece;

  void move(Move move) {
    if (move.turn != turn) {
      throw Exception("it is not ${move.turn.name}'s turn");
    }
    final piece = this[move.departure];
    if (piece == null) {
      throw Exception('piece was not found');
    }
    if (piece.type != move.piece) {
      throw Exception('piece was not found');
    }
    // TODO check validity of the move
    final target = this[move.destination];
    if(move.capture) {
      if(target == null) {
        throw Exception('destination is not occupied for capturing move');
      }
    } else {
      if(target != null) {
        throw Exception('destination is occupied for non-capture move');
      }
    }
    this[move.departure] = null;
    this[move.destination] = piece;
    // TODO promotion?
    // TODO update enPassant
    // TODO update halfMoveClock
    // TODO update fullMoveClock
  }

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

  String notation() =>
      '${piece.notation.toUpperCase()}${departure.notation}${capture ? 'x' : ''}${destination.notation}';
}
