import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              var bgcolor = Color.fromARGB(255, 219, 136, 165);
              if (data['user-answer'] == data['correct-answer']) {
                bgcolor = const Color.fromARGB(255, 165, 214, 167);
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CircleAvatar(
                      backgroundColor: bgcolor,
                      child: Text(
                        (((data['question-index'] as int) + 1)).toString(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                              fontSize: 17,
                              color: Color.fromARGB(255, 211, 175, 224)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user-answer'] as String,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: Color.fromARGB(255, 183, 97, 214),
                          ),
                        ),
                        Text(
                          data['correct-answer'] as String,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: Color.fromARGB(255, 109, 167, 233),
                          ),
                        ),
                        SizedBox(height: 13),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
