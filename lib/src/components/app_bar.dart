import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar() {
  return AppBar(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
    ),
    toolbarHeight: 65,
    title: Container(
      alignment: Alignment.center,
      child: Text(
        "WORDLE",
        style: GoogleFonts.getFont(
          'Solway',
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    ),
    leading: IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.stacked_bar_chart),
        onPressed: () {},
        iconSize: 28,
      )
    ],
  );
}
