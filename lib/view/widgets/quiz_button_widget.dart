import 'package:flutter/material.dart';
import 'package:quiz_app/utils/quiz_colors.dart';

class QuizButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final IconData icon;
  const QuizButtonWidget({
    required this.buttonText,
    this.onPressed,
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: QuizColors.lightPurple,
        side: const BorderSide(
          width: 2.0,
          color: QuizColors.lightPurpleWithTransparency,
        ),
      ),
      icon: Icon(icon),
      label: Text(
        buttonText,
      ),
      onPressed: onPressed,
    );
  }
}
