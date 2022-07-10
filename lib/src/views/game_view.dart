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
  // By default, the game would have a 5 letter word,
  // to be found out within 6 max guesses.

  // So, create 6 Words (6 max guesses),
  List<Word> _words = List.generate(6, (_) {
    return Word(
      // with 5 letters each...
      letters: List.generate(5, (_) {
        return Letter.empty();
      }),
    );
  });

  int currentWordIndex = 0;
  Word solution = Word.fromString("hello");

  // On pressing any alphabet in the keyboard, add that letter to word
  _onKeyPressed(String letter) {
    Word currentWord = _words[currentWordIndex];
    setState(() {
      currentWord.addLetter(letter);
    });
  }

  // On pressing DEL key, remove the last entered letter
  _onDeleteKeyPressed() {
    Word currentWord = _words[currentWordIndex];
    setState(() {
      currentWord.removeLetter();
    });
  }

  // On pressing ENTER key, submit the solution
  _onEnterKeyPressed() {
    Word currentWord = _words[currentWordIndex];
    setState(() {
      if (_words.length - 1 >= currentWordIndex) {
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
      }
      if (_words.length - 1 == currentWordIndex) {
        String solutionWord = solution.wordString;
        bool hasWon = currentWord == solution;
        showDialog(
          builder: (BuildContext newContext) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    !hasWon
                        ? Text(
                            "You Lost!. The word was $solutionWord",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : const Text("You Won"),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(newContext).pop();
                        setState(() {
                          currentWordIndex = 0;
                          _words = List.generate(6, (_) {
                            return Word(
                              // with 5 letters each...
                              letters: List.generate(5, (_) {
                                return Letter.empty();
                              }),
                            );
                          });
                        });
                      },
                      child: Text("Restart"),
                    )
                  ],
                ),
              ),
            );
          },
          context: context,
          barrierDismissible: true,
        );
      } else {
        currentWordIndex++;
      }
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
