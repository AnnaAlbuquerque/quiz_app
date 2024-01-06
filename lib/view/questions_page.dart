import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/view/result_page.dart';
import 'package:quiz_app/view/widgets/gradient_container.dart';
import 'package:quiz_app/view/widgets/question_widget.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final List<String> _selectedAnswers = [];
  int currentIndex = 0;

  void answerQuestion(String answer) {
    _selectedAnswers.add(answer);
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            selectedAnswers: _selectedAnswers,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _selectedAnswers.clear();
    super.dispose();
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
