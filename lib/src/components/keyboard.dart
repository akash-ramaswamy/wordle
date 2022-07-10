// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/src/theme/colors.dart';

const keyboardRowsData = [
  ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
  ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
  ["ENTER", "z", "x", "c", "v", "b", "n", "m", "DEL"]
];

class Keyboard extends StatelessWidget {
  final VoidCallback onKeyPress;
  final VoidCallback onEnterPress;
  final VoidCallback onDeletePress;

  const Keyboard({
    Key? key,
    required this.onKeyPress,
    required this.onEnterPress,
    required this.onDeletePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...keyboardRowsData.map(
          (row) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...row.map(
                  (letter) {
                    switch (letter) {
                      case "ENTER":
                        return _KeyboardButton(
                          letter: letter,
                          width: 56,
                          backgroundColor: Colors.white,
                          onKeyPress: onEnterPress,
                        );
                      case "DEL":
                        return _KeyboardButton(
                          letter: letter,
                          backgroundColor: Colors.white,
                          onKeyPress: onDeletePress,
                        );
                      default:
                        return _KeyboardButton(
                          letter: letter,
                          backgroundColor: Colors.white,
                          onKeyPress: onKeyPress,
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _KeyboardButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onKeyPress;
  final Color backgroundColor;
  final String letter;

  const _KeyboardButton({
    Key? key,
    this.height = 48,
    this.width = 30,
    required this.onKeyPress,
    required this.backgroundColor,
    required this.letter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 2.0),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(3.0),
        child: InkWell(
          onTap: onKeyPress,
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: Text(
              letter.toUpperCase(),
              style: GoogleFonts.getFont(
                'Solway',
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
