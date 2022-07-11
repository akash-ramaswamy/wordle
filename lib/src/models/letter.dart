import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../theme/colors.dart';

enum LetterStatus { initial, notInWord, inWrongPlace, inCorrectPlace }

class Letter extends Equatable {
  final String val;
  final LetterStatus status;

  const Letter({
    required this.val,
    this.status = LetterStatus.initial,
  });

  factory Letter.empty() => const Letter(val: "");

  Color get backgroundColor {
    switch (status) {
      case LetterStatus.notInWord:
        return notInWordBgColor;
      case LetterStatus.inWrongPlace:
        return inWrongPlaceBgColor;
      case LetterStatus.inCorrectPlace:
        return inCorrectPlaceBgColor;
      case LetterStatus.initial:
      default:
        return primaryDark;
    }
  }

  Letter copywith(String? val, LetterStatus? status) {
    return Letter(val: val ?? this.val, status: status ?? this.status);
  }

  @override
  List<Object?> get props => [val, status];
}
