import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  static const questions = [
    {
      'QuestionText': 'What\'s your favorite color ?',
      'answer': ['Blue', 'Red', 'Black', 'White']
    },
    {
      'QuestionText': 'What\'s your favorite animal ?',
      'answer': ['Dog', 'Croco', 'Whale', 'Tiger']
    },
    {
      'QuestionText': 'What\'s your favorite language ?',
      'answer': ['French', 'English', 'Spanish', 'Dutch']
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first App'),
          ),
          body: Column(children: [
            Question(questions[_questionIndex]['QuestionText'] as String),
            ...(questions[_questionIndex]['answer'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ])),
    );
  }
}
