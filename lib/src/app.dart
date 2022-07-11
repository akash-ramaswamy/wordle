import 'package:flutter/material.dart';

import 'theme/colors.dart';
import 'views/game_view.dart';

class WordleApp extends StatelessWidget {
  const WordleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordle',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryLight,
        ),
        scaffoldBackgroundColor: primaryDark,
      ),
      home: const GameView(),
    );
  }
}
