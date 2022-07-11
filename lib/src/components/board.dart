import 'package:flutter/material.dart';
import 'package:wordle/src/theme/styles.dart';

import '../models/word.dart';
import '../theme/colors.dart';
import 'word_container.dart';

class Board extends StatelessWidget {
  final List<Word> words;

  const Board({
    Key? key,
    required this.words,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: primaryLight,
        borderRadius: defaultRadius,
      ),
      padding: defaultPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: words.map((word) => WordContainer(letters: word.letters)).toList(),
      ),
    );
  }
}
