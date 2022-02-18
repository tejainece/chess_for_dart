import 'dart:collection';

import 'package:chess_for_dart/src/piece.dart';
import 'package:chess_for_dart/src/square.dart';

class FEN {
  final List<List<Piece?>> board;

  /// Which side is to move next
  final Side turn;

  final bool canWhiteCastleKingSide;
  final bool canWhiteCastleQueenSide;
  final bool canBlackCastleKingSide;
  final bool canBlackCastleQueenSide;

  final Square? enPassant;
  final int halfMoveClock;
  final int fullMoveClock;
  // TODO repetition

  const FEN(
      {required this.board,
      required this.turn,
      required this.enPassant,
      required this.canWhiteCastleKingSide,
      required this.canWhiteCastleQueenSide,
      required this.canBlackCastleKingSide,
      required this.canBlackCastleQueenSide,
      required this.halfMoveClock,
      required this.fullMoveClock});

  factory FEN.parse(String fen) {
    final fields = fen.split(' ');
    if (fields.length != 6) {
      throw Exception('invalid FEN: expected 6 fields');
    }

    final board = parseBoard(fields[0]);
    Side turn;
    switch (fields[1]) {
      case 'w':
        turn = Side.white;
        break;
      case 'b':
        turn = Side.black;
        break;
      default:
        throw Exception('invalid FEN: invalid value in active color field');
    }

    final canWhiteCastleKingSide = fields[2].contains('K');
    final canWhiteCastleQueenSide = fields[2].contains('Q');
    final canBlackCastleKingSide = fields[2].contains('k');
    final canBlackCastleQueenSide = fields[2].contains('q');

    Square? enPassant;
    if (fields[3] != '-') {
      enPassant = Square.parse(fields[3]);
    }

    final halfMoveClock = int.parse(fields[4]);
    final fullMoveClock = int.parse(fields[5]);

    return FEN(
        board: board,
        turn: turn,
        enPassant: enPassant,
        canWhiteCastleKingSide: canWhiteCastleKingSide,
        canWhiteCastleQueenSide: canWhiteCastleQueenSide,
        canBlackCastleKingSide: canBlackCastleKingSide,
        canBlackCastleQueenSide: canBlackCastleQueenSide,
        halfMoveClock: halfMoveClock,
        fullMoveClock: fullMoveClock);
  }

  String encodeBoard() => encodeBoardPlacement(board);

  String encodeTurn() => turn == Side.white ? 'w' : 'b';

  String encodeEnPassant() => enPassant?.notation ?? '-';

  String encodeCastling() {
    final sb = StringBuffer();

    if (canWhiteCastleKingSide) {
      sb.write('K');
    }
    if (canWhiteCastleQueenSide) {
      sb.write('Q');
    }
    if (canBlackCastleKingSide) {
      sb.write('k');
    }
    if (canBlackCastleQueenSide) {
      sb.write('q');
    }

    return sb.isEmpty ? '-' : sb.toString();
  }

  String encode() {
    final sb = StringBuffer();

    sb.write(encodeBoard());
    sb.write(' ');
    sb.write(encodeTurn());
    sb.write(' ');
    sb.write(encodeCastling());
    sb.write(' ');
    sb.write(encodeEnPassant());
    sb.write(' ');
    sb.write(halfMoveClock);
    sb.write(' ');
    sb.write(fullMoveClock);
    sb.write(' ');

    return sb.toString();
  }

  static List<List<Piece?>> parseBoard(String placement) {
    final rankPlacement = placement.split('/');

    if (rankPlacement.length != 8) {
      throw Exception('invalid FEN: expected 8 ranks in piece placement');
    }

    return List.unmodifiable(rankPlacement.map(parseRank).toList().reversed);
  }

  static List<Piece?> parseRank(String rankPlacement) {
    final ret = <Piece?>[];
    for (final c in rankPlacement.split('')) {
      final Piece? piece = Piece.notationMap[c];
      if (piece != null) {
        ret.add(piece);
      } else {
        final count = int.tryParse(c);
        if (count == null) {
          throw Exception(
              'invalid FEN: invalid character "$c" in piece placement');
        } else if (count > 8) {
          throw Exception(
              'invalid FEN: empty squares in a rank cannot be more than 8');
        }
        ret.addAll(List.filled(count, null));
      }
    }

    if (ret.length != 8) {
      throw Exception('invalid FEN: rank rank should have exactly 8 files');
    }

    return List.unmodifiable(ret);
  }

  static String encodeBoardPlacement(List<List<Piece?>> board) =>
      board.reversed.map(encodeRankPlacement).join('/');

  static String encodeRankPlacement(List<Piece?> rank) {
    final sb = StringBuffer();

    int empty = 0;
    for (final p in rank) {
      if (p != null) {
        if (empty != 0) {
          sb.write(empty);
          empty = 0;
        }
        sb.write(p.notation);
      } else {
        empty++;
      }
    }

    if (empty != 0) {
      sb.write(empty);
      empty = 0;
    }

    return sb.toString();
  }

  static const starting = FEN(
      board: startingBoard,
      turn: Side.white,
      enPassant: null,
      canWhiteCastleKingSide: true,
      canWhiteCastleQueenSide: true,
      canBlackCastleKingSide: true,
      canBlackCastleQueenSide: true,
      halfMoveClock: 0,
      fullMoveClock: 0);

  static const startingBoard = [
    [
      Piece.whiteRook,
      Piece.whiteKnight,
      Piece.whiteBishop,
      Piece.whiteQueen,
      Piece.whiteKing,
      Piece.whiteBishop,
      Piece.whiteKnight,
      Piece.whiteRook
    ],
    [
      Piece.whitePawn,
      Piece.whitePawn,
      Piece.whitePawn,
      Piece.whitePawn,
      Piece.whitePawn,
      Piece.whitePawn,
      Piece.whitePawn,
      Piece.whitePawn
    ],
    [null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null],
    [
      Piece.blackPawn,
      Piece.blackPawn,
      Piece.blackPawn,
      Piece.blackPawn,
      Piece.blackPawn,
      Piece.blackPawn,
      Piece.blackPawn,
      Piece.blackPawn
    ],
    [
      Piece.blackRook,
      Piece.blackKnight,
      Piece.blackBishop,
      Piece.blackQueen,
      Piece.blackKing,
      Piece.blackBishop,
      Piece.blackKnight,
      Piece.blackRook
    ],
  ];
}
