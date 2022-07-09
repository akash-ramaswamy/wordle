import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Game View",
          style: GoogleFonts.getFont('Martel'),
        ),
      ),
    );
  }
}
