import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../src/components/app_bar.dart';

class WordleApp extends StatelessWidget {
  const WordleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordle',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFF252b39),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0XFF1d1f2a),
        appBar: buildAppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0XFF252b39),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: const [
                  InputBoxRow(color: true),
                  SizedBox(height: 10),
                  InputBoxRow(),
                  SizedBox(height: 10),
                  InputBoxRow(),
                  SizedBox(height: 10),
                  InputBoxRow(),
                  SizedBox(height: 10),
                  InputBoxRow(),
                  SizedBox(height: 10),
                  InputBoxRow(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputBoxRow extends StatelessWidget {
  final bool? color;
  const InputBoxRow({
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InputBox(color: color),
        InputBox(color: color),
        InputBox(color: color),
        InputBox(color: color),
        InputBox(color: color),
      ],
    );
  }
}

class InputBox extends StatelessWidget {
  final bool? color;
  const InputBox({
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color:
            color == true ? const Color(0XFF434952) : const Color(0XFF1d1f2a),
      ),
      child: SizedBox(
        height: 58,
        width: 58,
        child: color == true ? _buildButton("A") : null,
      ),
    );
  }
}

const Color notInWord = Color(0XFF434952);
const Color inWrongSpot = Color(0XFFCC972D);
const Color inCorrectSpot = Color(0XFF1B7626);

Widget _buildButton(String letter) {
  return Container(
    padding: const EdgeInsets.all(5),
    child: Center(
      child: Text(
        letter,
        style: GoogleFonts.getFont(
          'Solway',
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
