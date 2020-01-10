//material.dart has a lot of built-in widgets
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//First function that Dart and Flutter read
//runApp is a function provided by material.dart
void main() => runApp(MyApp());

//It's possible to use "=>" when a function has only one expression

class MyApp extends StatefulWidget {
  // createState ahould return a State, and our class MyAppState extends from State
  // So that means, that we can return it. And with that complete, the two pieces are connected.
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//State<MyApp> means that the class MyAppState belongs to My App
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  static const _questions = [
    {
      'questionText': 'What\'s your favorite color ?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answer': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answer': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1}
      ],
    },
  ];

  void _answerQuestion(int score) {
    //setState is a function that makes Flutter re-render the user interface
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("We have more question !");
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  //BuildContext is a special object type provided by Flutter
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My App"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
