import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/utils/quiz_colors.dart';
import 'package:quiz_app/view/widgets/answer_widget.dart';

class QuestionWidget extends StatelessWidget {
  final QuestionModel questionModel;
  final void Function(String answer) answerQuestion;
  const QuestionWidget({
    required this.questionModel,
    required this.answerQuestion,
    Key? key,
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
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 20,
              color: QuizColors.lightPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              ...questionModel.shuffledAnswers
                  .map(
                    (answer) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: AnswerWidget(
                        answer: answer,
                        onPressed: () {
                          answerQuestion(answer);
                        },
                      ),
                    ),
                  )
                  .toList()
            ],
          )
        ],
      ),
    );
  }
}
