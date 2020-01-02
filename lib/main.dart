//material.dart has a lot of built-in widgets
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    //setState is a function that makes Flutter re-render the user interface
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  //BuildContext is a special object type provided by Flutter
  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color ?',
        'answer': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favorite animal ?',
        'answer': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answer': ['Max', 'Max', 'Max', 'Max'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questionText: questions[_questionIndex]['questionText'],
            ),
            // ... - take a list and pull all the values in the list out of it and add them to the surrounding list as individual values.
            //With this instead of adding a list to a list we are adding the values of a list to a list
            ...(questions[_questionIndex]['answer'] as List<String>).map((answer){
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
