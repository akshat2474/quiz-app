import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/questions.dart';
import 'question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, {super.key});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'your_answer': chosenAnswers[i],
        'is_correct': chosenAnswers[i] == questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = chosenAnswers.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['your_answer'] == data['correct_answer'];
    }).length;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answeres $numCorrectQuestion out of $numTotalQuestion questions correctly",
            style: GoogleFonts.lato(
                color: Color.fromARGB(255, 237, 223, 252),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          QuestionSummary(getSummaryData()),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                (Navigator.popUntil(context, ModalRoute.withName('/')));
              },
              child: Text(
                "Restart Quiz",
                style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 237, 223, 252),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
