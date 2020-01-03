import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map< String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({@required this.questions,@required this.answerQuestion,@required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questionText: questions[questionIndex]['questionText'],
        ),
        // ... - take a list and pull all the values in the list out of it and add them to the surrounding list as individual values.
        //With this instead of adding a list to a list we are adding the values of a list to a list
        ...(questions[questionIndex]['answer'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList()
      ],
    );
  }
}
