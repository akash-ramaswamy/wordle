import 'package:flutter/material.dart';

import '../models/letter.dart';
import '../theme/styles.dart';

class LetterContainer extends StatelessWidget {
  final Letter letter;
  const LetterContainer({
    required this.letter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: letter.backgroundColor,
        border: letter.border,
      ),
      alignment: Alignment.center,
      width: 60,
      height: 60,
      child: Text(
        letter.val.toUpperCase(),
        style: letterContainerTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
