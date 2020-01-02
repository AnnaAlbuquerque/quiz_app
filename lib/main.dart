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
      "What's your favorite color ?",
      "What's your favorite animal ?",
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: Column(
          children: <Widget>[
            Question(questionText: questions[_questionIndex]),
            //We are passing the _answerQuestion function and this is called callback, since the receiving widget calls this function in the future
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
          ],
        ),
      ),
    );
  }
}
