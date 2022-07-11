import "dart:math";
import 'package:flutter/material.dart';

import '../components/app_bar.dart';
import '../components/board.dart';
import '../components/keyboard.dart';
import '../components/result_dialog.dart';
import '../data/words_list.dart';
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
  // By default, the game would have a 5 letter word,
  // to be found out within 6 max guesses.

  // So, create 6 Words (6 max guesses),
  List<Word> words = List.generate(6, (_) {
    return Word(
      // with 5 letters each...
      letters: List.generate(5, (_) {
        return Letter.empty();
      }),
    );
  });

  int currentWordIndex = 0;
  Word solution = Word.fromString(wordsList[Random().nextInt(wordsList.length)].toLowerCase());

  // On pressing any alphabet in the keyboard, add that letter to word
  _onKeyPressed(String letter) {
    Word currentWord = words[currentWordIndex];
    setState(() => currentWord.addLetter(letter));
  }

  // On pressing DEL key, remove the last entered letter
  _onDeleteKeyPressed() {
    Word currentWord = words[currentWordIndex];
    setState(() {
      currentWord.removeLetter();
    });
  }

  // On pressing ENTER key, submit the solution
  _onEnterKeyPressed() => setState(_checkGuess);

  _resetGame() {
    words = List.generate(6, (_) {
      return Word(
        letters: List.generate(5, (_) {
          return Letter.empty();
        }),
      );
    });

    currentWordIndex = 0;
  }

  _checkGuess() {
    Word currentWord = words[currentWordIndex];

    for (var i = 0; i < currentWord.letters.length; i++) {
      Letter currentLetter = currentWord.letters[i];
      if (solution.letters[i] == currentLetter) {
        currentWord.letters[i] = currentLetter.copywith(
          null,
          LetterStatus.inCorrectPlace,
        );
      } else if (solution.letters.contains(currentLetter)) {
        currentWord.letters[i] = currentLetter.copywith(
          null,
          LetterStatus.inWrongPlace,
        );
      } else {
        currentWord.letters[i] = currentLetter.copywith(
          null,
          LetterStatus.notInWord,
        );
      }
    }

    String solutionWord = solution.wordString;
    bool hasWon = currentWord.wordString == solution.wordString;
    String resultText =
        hasWon ? "You win" : "You have lost!\nThe word was ${solutionWord.toUpperCase()}";

    if (!hasWon && currentWordIndex == words.length - 1 || hasWon) {
      _showResultDialog(resultText);
    } else if (currentWordIndex != words.length - 1) {
      currentWordIndex++;
    }
  }

  _showResultDialog(String resultText) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return ResultDialog(
          resultText: resultText,
          action: () => setState(_resetGame),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("The word is ${solution.wordString}");
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
                Board(words: words),
                const SizedBox(height: 20),
                Keyboard(
                  onDeletePress: _onDeleteKeyPressed,
                  onEnterPress: _onEnterKeyPressed,
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
