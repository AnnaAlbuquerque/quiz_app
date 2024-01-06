import 'package:flutter/widgets.dart';
import 'package:quiz_app/utils/quiz_colors.dart';

class QuestionSummaryWidget extends StatelessWidget {
  final List<Map<String, dynamic>> summaryData;
  const QuestionSummaryWidget({
    required this.summaryData,
    Key? key,
  }) : super(key: key);

  bool selectedAnswerIsCorrect(Map<String, dynamic> map) {
    return (map['correct_answer'] as String) == (map['user_answer'] as String);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData
          .map(
            (data) => Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: QuizColors.lightPurple,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedAnswerIsCorrect(data)
                            ? QuizColors.lightGreen
                            : QuizColors.lightRed,
                      ),
                      child: Center(
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                            color: QuizColors.darkPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              color: QuizColors.lightPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ...selectedAnswerIsCorrect(data)
                              ? [
                                  Text(
                                    data['correct_answer'] as String,
                                    style: const TextStyle(
                                      color: QuizColors.lightGreen,
                                      fontSize: 14,
                                    ),
                                  ),
                                ]
                              : [
                                  Text(
                                    data['user_answer'] as String,
                                    style: const TextStyle(
                                      color: QuizColors.lightRed,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    data['correct_answer'] as String,
                                    style: const TextStyle(
                                      color: QuizColors.lightGreen,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
