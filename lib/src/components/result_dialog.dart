import 'package:flutter/material.dart';

import '../theme/styles.dart';

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
            Text(
              resultText,
              style: letterContainerTextStyle.copyWith(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                action();
                Navigator.of(context).pop();
              },
              child: Text(
                "restart".toUpperCase(),
                style: letterContainerTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
