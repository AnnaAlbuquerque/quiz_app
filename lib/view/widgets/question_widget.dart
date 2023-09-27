import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/utils/quiz_colors.dart';
import 'package:quiz_app/view/widgets/answer_widget.dart';

class QuestionWidget extends StatelessWidget {
  final QuestionModel questionModel;
  const QuestionWidget({
    Key? key,
    required this.questionModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questionModel.question,
            style: const TextStyle(
              color: QuizColors.lightPurple,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: questionModel.options
                .map(
                  (answer) => AnswerWidget(answer: answer),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
