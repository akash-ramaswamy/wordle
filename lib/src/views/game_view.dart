import 'package:flutter/material.dart';

import '../components/app_bar.dart';
import '../theme/colors.dart';
import '../theme/styles.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
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
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            padding: defaultPadding,
            child: Column(
              children: const [],
            ),
          )
        ],
      ),
    );
  }
}
