import 'package:flutter/material.dart';

import '../components/app_bar.dart';
import '../components/board.dart';
import '../components/keyboard.dart';
import '../models/letter.dart';
import '../models/word.dart';
import '../theme/colors.dart';
import '../theme/styles.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  final List<Word> _words = List.generate(6, (_) {
    return Word(
      letters: List.generate(5, (_) {
        return Letter.empty();
      }),
    );
  });
  int currentWordIndex = 0;
  Word _solution = Word.fromString("hello");

  _onKeyPressed(String letter) {
    Word currentWord = _words[currentWordIndex];
    setState(() {
      currentWord.addLetter(letter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: primaryDark,
              borderRadius: defaultRadius,
            ),
            padding: defaultPadding,
            child: Column(
              children: [
                Board(words: _words),
                const SizedBox(height: 20),
                Keyboard(
                  onDeletePress: () {},
                  onEnterPress: () {},
                  onKeyPress: _onKeyPressed,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
