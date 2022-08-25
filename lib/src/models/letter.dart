import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

enum LetterStatus { initial, notInWord, inWrongPlace, inCorrectPlace }

class Letter extends Equatable {
  final String val;
  final LetterStatus status;
  final bool isEmptyValue;

  const Letter({
    required this.val,
    this.status = LetterStatus.initial,
    this.isEmptyValue = false,
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

  Border? get border {
    if (isEmptyValue) {
      return Border.all(
        color: Colors.red,
        width: 2.0,
        style: BorderStyle.solid,
      );
    }
    return null;
  }

  Letter copywith({String? val, LetterStatus? status, bool? isEmptyValue}) {
    return Letter(
      val: val ?? this.val,
      status: status ?? this.status,
      isEmptyValue: isEmptyValue ?? this.isEmptyValue,
    );
  }

  @override
  List<Object?> get props => [val, status];
}
