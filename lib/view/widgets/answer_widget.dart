import 'package:flutter/material.dart';
import 'package:quiz_app/utils/quiz_colors.dart';

class AnswerWidget extends StatelessWidget {
  final String answer;
  final VoidCallback? onPressed;
  const AnswerWidget({
    required this.answer,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            width: 2.0,
            color: QuizColors.lightPurpleWithTransparency,
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            answer,
            textAlign: TextAlign.center,
            style: const TextStyle(color: QuizColors.lightPurple),
          ),
        ),
      ),
    );
  }
}
