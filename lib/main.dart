import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  List<String> questions = [
    'What\'s your favorite color?',
    'What\'s your favorite animal?',
  ];

  void answerQuestion() {
    setState(
      () {
        if (index < questions.length) {
          index++;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appLightMode(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Column(
          children: [
            Question(
              questionText: questions[index],
            ),
            Answer(
              text: 'Answer 1',
              onPressed: answerQuestion,
            ),
            Answer(
              text: 'Answer 2',
              onPressed: answerQuestion,
            ),
            Answer(
              text: 'Answer 3',
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
