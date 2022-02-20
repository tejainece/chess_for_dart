# Chess for Dart

Chess format parser, legal move generation and game state detection library for Dart

# Features

+ FEN and PGN encoding and decoding
+ Legal move generation

# Parse FEN

```dart
import 'package:chess_for_dart/chess_for_dart.dart';

void main() {
    final fen = FEN.parse('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1');
    print(fen.encode());
}
```

