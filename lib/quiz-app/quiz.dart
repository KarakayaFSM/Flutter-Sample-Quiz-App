import 'package:flutter/material.dart';
import 'package:sample_quiz_app/quiz-app/answer.dart';
import 'package:sample_quiz_app/quiz-app/question.dart';

class Quiz extends StatelessWidget {
  const Quiz(
      {Key? key,
      required this.questions,
      required this.answerQuestion,
      required this.questionIndex})
      : super(key: key);

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(
          questions[questionIndex]['questionText'] as String),
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map((answer) => Answer(() => answerQuestion(answer['score']), answer['text'] as String))
          .toList()
    ]);
  }
}
