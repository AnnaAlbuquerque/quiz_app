import 'package:flutter/material.dart';
import 'package:quiz_app/view/widgets/gradient_container.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return const GradientContainer();
  }
}
