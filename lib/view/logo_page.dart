import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/utils/quiz_colors.dart';
import 'package:quiz_app/view/questions_page.dart';
import 'package:quiz_app/view/widgets/gradient_container.dart';
import 'package:quiz_app/view/widgets/quiz_button_widget.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  final imagePath = 'assets/images/quiz-logo.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 300,
              color: QuizColors.lightPurpleWithTransparency,
            ),
            const SizedBox(height: 65),
            Text(
              'Learn Flutter the fun way !',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: QuizColors.lightPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            QuizButtonWidget(
              buttonText: 'Start Quiz',
              icon: Icons.arrow_forward,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuestionPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
