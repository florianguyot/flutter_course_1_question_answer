// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetQuiz;

  Result(this.score, this.resetQuiz);

  String get resultPhrase => "Nice, your score is $score";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
        FlatButton(
          onPressed: resetQuiz,
          child: Text(
            "Restart",
          ),
          textColor: Colors.blue,
        )
      ],
    );
  }
}
