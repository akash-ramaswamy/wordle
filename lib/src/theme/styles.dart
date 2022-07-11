import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle letterContainerTextStyle = GoogleFonts.getFont(
  'Solway',
  textStyle: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 35,
    color: Colors.white,
    textBaseline: TextBaseline.alphabetic 
  ),
);

const EdgeInsets defaultPadding = EdgeInsets.all(15);
const BorderRadius defaultRadius = BorderRadius.all(Radius.circular(20));
