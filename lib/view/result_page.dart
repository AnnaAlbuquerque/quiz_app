import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/utils/quiz_colors.dart';
import 'package:quiz_app/view/questions_page.dart';
import 'package:quiz_app/view/widgets/gradient_container.dart';
import 'package:quiz_app/view/widgets/questions_summary_widget.dart';
import 'package:quiz_app/view/widgets/quiz_button_widget.dart';

class ResultPage extends StatefulWidget {
  final List<String> selectedAnswers;
  const ResultPage({
    Key? key,
    required this.selectedAnswers,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<Map<String, dynamic>> getSummaryData() {
    final List<Map<String, dynamic>> summary = [];

    for (int i = 0; i < widget.selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].options[0],
        'user_answer': widget.selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summary.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return Scaffold(
      body: GradientContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: QuizColors.lightPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      QuestionSummaryWidget(
                        summaryData: summary,
                      ),
                      const SizedBox(height: 20),
                      QuizButtonWidget(
                        buttonText: 'Restart Quiz',
                        icon: Icons.refresh,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
