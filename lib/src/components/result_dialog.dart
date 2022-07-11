import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final String resultText;
  final VoidCallback action;
  const ResultDialog({
    Key? key,
    required this.resultText,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(resultText),
            ElevatedButton(
              onPressed: () {
                action();
                Navigator.of(context).pop();
              },
              child: const Text("Restart"),
            )
          ],
        ),
      ),
    );
  }
}
