import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback onReset;

  const Result({Key? key, required this.score, required this.onReset}) : super(key: key);

  String get resultPhrase {
    if (score <= 8) {
      return "You did it";
    } else if (score <= 12) {
      return "Pretty Likeable";
    } else if (score <= 16) {
      return "You're strange";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Text(
          "You did it",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(onPressed: onReset, child: const Text("Restart Quiz!"))
      ],
    ));
  }
}
