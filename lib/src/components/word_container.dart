import 'package:flutter/material.dart';

import '../models/letter.dart';
import 'letter_container.dart';

class WordContainer extends StatelessWidget {
  final List<Letter> letters;
  const WordContainer({
    Key? key,
    required this.letters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...letters.map((letter) {
            return LetterContainer(letter: letter);
          })
        ],
      ),
    );
  }
}
