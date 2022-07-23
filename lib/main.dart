import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  static const _questions = [
    {
      'QuestionText': 'What\'s your favorite color ?',
      'answer': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 5},
        {'text': 'Purple', 'score': 2},
      ]
    },
    {
      'QuestionText': 'What\'s your favorite animal ?',
      'answer': [
        {'text': 'Dog', 'score': 2},
        {'text': 'Croco', 'score': 10},
        {'text': 'Whale', 'score': 7},
        {'text': 'Tiger', 'score': 5},
      ]
    },
    {
      'QuestionText': 'What\'s your favorite language ?',
      'answer': [
        {'text': 'French', 'score': 3},
        {'text': 'English', 'score': 10},
        {'text': 'Spanish', 'score': 5},
        {'text': 'Dutch', 'score': 8},
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    print("score = ${_totalScore}");

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My first App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
