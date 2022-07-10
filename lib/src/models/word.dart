import 'package:equatable/equatable.dart';

import '../../src/models/letter.dart';

class Word extends Equatable {
  final List<Letter> letters;

  const Word({required this.letters});

  factory Word.fromString(String word) {
    final List<String> splittedLetters = word.split("");
    return Word(letters: [
      ...splittedLetters.map(
        (letter) => Letter(val: letter),
      )
    ]);
  }

  String get wordString => letters.map((letter) => letter.val).join();

  void addLetter(String letter) => letters.add(Letter(val: letter));

  void removeLetter() => letters.removeLast();

  @override
  List<Object?> get props => [letters];
}
