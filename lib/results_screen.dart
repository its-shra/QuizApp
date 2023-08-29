import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';
import 'package:quiz_app/start_screen.dart';
import '';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.func});

  final List<String> chosenAnswers;

  final Function() func;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question-index': i,
          'question': questions[i].text,
          'correct-answer': questions[i].answers[0],
          'user-answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['correct-answer'] == data['user-answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(115, 214, 188, 246),
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: func,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.autorenew),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
