import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/view/widgets/gradient_container.dart';
import 'package:quiz_app/view/widgets/question_widget.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int currentIndex = 0;

  void answerQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: QuestionWidget(
          questionModel: questions[currentIndex],
          answerQuestion: answerQuestion,
        ),
      ),
    );
  }
}
