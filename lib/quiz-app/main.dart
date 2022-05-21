import 'package:flutter/material.dart';
import 'package:sample_quiz_app/quiz-app/quiz.dart';
import 'package:sample_quiz_app/quiz-app/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  final _questions = const [
    {
      'questionText': 'What\'s your favorite food',
      'answers': [
        {'text': 'Pilav', 'score': 10},
        {'text': 'Köfte', 'score': 10},
        {'text': 'Döner', 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your favorite district',
      'answers': [
        {'text': 'Fatih', 'score': 10},
        {'text': 'Başakşehir', 'score': 7},
        {'text': 'Ümraniye', 'score': 5},
      ]
    },
    {
      'questionText': 'What\'s your favorite book',
      'answers': [
        {'text': 'Clean Code', 'score': 10},
        {'text': 'Refactoring', 'score': 10},
        {'text': 'Effective Java', 'score': 10},
      ]
    },
  ];

  var _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("My First App"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
                )
              : Result(
                  score: _totalScore,
                  onReset: _resetQuiz,
                )),
    );
  }
}
