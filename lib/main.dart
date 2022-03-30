import 'package:flutter/material.dart';
import 'package:sample_quiz_app/answer.dart';
import 'package:sample_quiz_app/question.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final questions = const [
    {
      'questionText': 'What\'s your favorite food',
    'answers': ['Pilav', 'Köfte', 'Döner']
    },
    {
      'questionText': 'What\'s your favorite district',
    'answers': ['Fatih', 'Başakşehir', 'Ümraniye']
    },
    {
      'questionText': 'What\'s your favorite book',
    'answers': ['Clean Code', 'Refactoring', 'Effective Java']
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = (++_questionIndex) % questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("My First App"),
          ),
          body: Column(children: [
            Question(questions[_questionIndex]['questionText'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(_answerQuestion, answer))
                .toList()
          ])),
    );
  }
}