import 'package:flutter/material.dart';
import 'package:quiz_app/view/utils/quiz_colors.dart';

class GradientContainer extends StatelessWidget {
  final Widget? child;
  const GradientContainer({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            QuizColors.darkPurple,
            QuizColors.mediumPurple,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: child,
    );
  }
}
